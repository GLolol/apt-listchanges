#!/usr/bin/python
#vim:set fileencoding=utf-8:
#
#      apt-listchanges - Show changelog entries between the installed versions
#        of a set of packages and the versions contained in corresponding
#        .deb files
#
#      Copyright (C) 2000-2002  Matt Zimmerman <mdz@debian.org>
#
#      This program is free software; you can redistribute it and/or modify
#      it under the terms of the GNU General Public License as published by
#      the Free Software Foundation; either version 2 of the License, or
#      (at your option) any later version.
#
#      This program is distributed in the hope that it will be useful,
#      but WITHOUT ANY WARRANTY; without even the implied warranty of
#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#      GNU General Public License for more details.
#
#      You should have received a copy of the GNU General Public
#      License along with this program; if not, write to the Free
#      Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
#      MA 02111-1307 USA
#

import sys
import apt_pkg
import gettext
import anydbm
import commands

sys.path += ['./apt-listchanges', '/usr/share/apt-listchanges']
import apt_listchanges, DebianControlParser

def main():
    try:
        _ = gettext.translation('apt-listchanges').lgettext
    except IOError:
        _ = lambda str: str

    config = apt_listchanges.Config()
    config.read('/etc/apt/listchanges.conf')
    debs = config.getopt(sys.argv)

    if (debs == None or len(debs) == 0) and not config.apt_mode:
        config.usage(1);

    apt_pkg.InitSystem()

    if config.apt_mode:
        debs = apt_listchanges.read_apt_pipeline(config)

    if config.frontend == 'none':
        sys.exit(0)

    # If apt is in quiet (loggable) mode, we should make our output
    # loggable too
    if config.quiet == 1:
        config.frontend = 'text'
    elif config.quiet >= 2:
        config.frontend = 'mail'

    if not config.show_all:
        status = DebianControlParser.DebianControlParser()
        status.readfile('/var/lib/dpkg/status')
        status.makeindex('Package')

    if config.save_seen:
        seen = anydbm.open(config.save_seen, 'c')
        # Will replace seen after changes have actually been seen
        seen_new = {}

    all_news = []
    all_changelogs = []
    notes = []

    # Mapping of source->binary packages
    source_packages = {}

    # Flag for each source package, only set if changelogs were actually found
    found = {}

    frontend = apt_listchanges.make_frontend(config.frontend, len(debs), config)
    if frontend == None:
        sys.stderr.write(_("Unknown frontend: %s\n") % config.frontend)
        sys.exit(1)

    # Main loop
    for deb in debs:
        pkg = apt_listchanges.Package(deb)
        binpackage = pkg.binary
        srcpackage = pkg.source
        srcversion = pkg.source_version

        frontend.update_progress()
        # Show changes later than fromversion
        fromversion = None

        #print "Processing %s (%s)" % (binpackage, srcpackage)

        if not config.show_all:
            if config.save_seen and seen.has_key(srcpackage):
                fromversion = seen[srcpackage]
            else:
                statusentry = status.find('Package', binpackage)
                if statusentry and statusentry.installed():
                    fromversion = statusentry.sourceversion()
                else:
                    # Package not installed or seen
                    notes.append(_("%s: will be newly installed") % binpackage)
                    continue

        source_packages.setdefault(srcpackage, []).append(binpackage)

        if found.has_key(srcpackage):
            continue

        if not config.show_all and apt_pkg.VersionCompare(fromversion, srcversion) >= 0:
            notes.append(_("%s: Version %s has already been seen") % (binpackage,
                                                                      srcversion))
            continue

        (news, changelog) = pkg.extract_changes(config.which, fromversion)

        if news or changelog:
            found[srcpackage] = 1
            if news:
                all_news.append(news)
            if changelog:
                all_changelogs.append(changelog)

            if config.save_seen:
                seen_new[srcpackage] = srcversion

    frontend.progress_done()

    if config.save_seen:
        seen.close()

    for batch in (all_news, all_changelogs):
        batch.sort(lambda a, b: -cmp(a.urgency, b.urgency) or
                   cmp(a.package, b.package))

    if config.headers:
        changes = ''
        news = ''
        for rec in all_news:
            if not rec.changes:
                continue

            package = rec.package
            header = _('News for %s') % package
            if len(filter(lambda x: x != package, source_packages[package])) > 0:
                # Differing source and binary packages
                header += ' (' + ' '.join(source_packages[package]) + ')'
            news += '--- ' + header + ' ---\n' + rec.changes

        for rec in all_changelogs:
            if not rec.changes:
                continue

            package = rec.package
            header = _('Changes for %s') % package
            if len(filter(lambda x: x != package, source_packages[package])) > 0:
                # Differing source and binary packages
                header += ' (' + ' '.join(source_packages[package]) + ')'
            changes += '--- ' + header + ' ---\n' + rec.changes
    else:
        news    = ''.join([x.changes for x in all_news       if x.changes])
        changes = ''.join([x.changes for x in all_changelogs if x.changes])

    if config.verbose and len(notes) > 0:
        changes += _("Informational notes") + ":\n\n" + '\n'.join(notes)

    if news:
        frontend.display_output(news)

    if changes:
        frontend.display_output(changes)

    if news or changes:
        if config.confirm and not frontend.confirm():
            sys.stderr.write('Aborting.\n')
            sys.exit(10)

        hostname = commands.getoutput('hostname')

        if config.email_address and changes:
            subject = _("apt-listchanges: changelogs for %s") % hostname
            apt_listchanges.mail_changes(config.email_address, changes, subject)

        if config.email_address and news:
            subject = _("apt-listchanges: news for %s") % hostname
            apt_listchanges.mail_changes(config.email_address, news, subject)

        # Write out seen db
        if config.save_seen:
            seen = anydbm.open(config.save_seen, 'c')
            for (key, value) in seen_new.items():
                seen[key] = value
            seen.close()

    elif not config.apt_mode and not source_packages.keys():
        sys.stderr.write("apt-listchanges: "
                         + _("didn't find any valid .deb archives") + "\n")
        sys.exit(1)

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(1)
