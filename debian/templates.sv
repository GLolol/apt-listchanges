Template: apt-listchanges/apt-hook-p
Type: boolean
Default: true
Description: Should apt-listchanges be automatically run by apt?
 One way to use apt-listchanges is to configure apt to run apt-listchanges on
 packages that have been downloaded for installation or upgrade.  This way,
 each time you perform an installation or upgrade using apt,
 apt-listchanges will show you the changes that are about to be made
 to your system.
 .
 I can perform this configuration for you if you like.  Since you can also run
 apt-listchanges manually on .deb archives, this step is optional.
Description-sv: Ska apt-listchanges k�ras automatiskt av apt?
 Ett s�tt att anv�nda apt-listchanges �r att konfigurera apt att k�ra
 apt-listchanges p� paket som har laddats ner f�r installation eller
 uppgradering. Varje g�ng du utf�r en installation eller uppgradering kommer
 d� apt-listchanges att visa alla �ndringar som �r p� v�g att g�ras p� ditt
 system.
 .
 Jag kan utf�ra denna konfiguration om du vill. Eftersom du ocks� kan k�ra
 apt-listchanges manuellt p� .deb arkiv s� �r detta steg frivilligt.

Template: apt-listchanges/frontend
Type: select
Choices: pager, xterm-pager, newt, text, mail
Default: pager
Description: How should changelogs be displayed by default?
 apt-listchanges can display changelog entries in a number of different ways.
 .
 pager - Use your preferred pager
 .
 xterm-pager - Use your preferred pager in an xterm in the background
 .
 newt - Use a terminal graphics interface, using text-mode windows
 (you will need to install libnewt-perl to use this)
 .
 text  - Print changelogs to your terminal (without pausing)
 .
 mail  - Send changelogs via email (you will be prompted for an address)
 .
 This setting can be overridden by a command-line option.
Choices-sv: pager, xterm-pager, newt, text, post
Description-sv: Hur ska f�r�ndringsloggar visas som standard?
 apt-listchanges kan visa poster fr�n f�r�ndringloggar p� flera s�tt.
 .
 pager - Anv�nd din f�redragna "pager"
 .
 xterm-pager - Anv�nd din f�redragna "pager" i en xterm som k�rs i bakgrunden
 .
 newt - Anv�nd ett grafiskt l�ge f�r terminalen, som anv�nder f�nster i text-l�ge
 (du m�ste installera libnewt-perl f�r att anv�nda detta)
 .
 text - Skriv ut f�r�ndringsloggar till din terminal (utan att pausa)
 .
 post - Skicka f�r�ndringsloggar via e-post (en adress kommer att efterfr�gas)
 .
 Denna inst�llning kan �sidos�ttas genom en flagga p� kommandoraden.

Template: apt-listchanges/email-address
Type: string
Default: root
Description: To whom should apt-listchanges mail changelog entries?
 You have chosen to have changelog entries sent via email.  To what email
 address should they be sent?
Description-sv: Till vem ska apt-listchanges skicka poster fr�n f�r�ndringsloggar?
 Du har valt att f� poster fr�n f�r�ndringsloggar skickade via e-post. Till
 vilken e-post adress ska dessa skickas?

Template: apt-listchanges/confirm
Type: boolean
Default: true
Description: Should apt-listchanges prompt for confirmation after displaying changelogs?
 After giving you a chance to display changelog entries,
 apt-listchanges can ask whether or not you would like to continue.
 This is useful when running from apt, as it gives you a chance to
 abort the upgrade if you see a change you do not want to apply (yet).
 .
 This setting only applies when running from apt.  Otherwise, it can be
 requested with a command line option.
Description-sv: Ska apt-listchanges beg�ra konfirmation efter att ha visat f�r�ndringsloggar?
 Efter att ha gett dig en m�jlighet att visa poster fr�n f�r�ndringsloggar
 kan apt-listchanges fr�ga dig om du vill forts�tta. Detta �r anv�ndbart
 n�r den k�rs fr�n apt eftersom det ger dig en m�jlighet att avbryta
 uppgradering om du ser en f�r�ndring som du inte vill ska ske (�nnu.)

Template: apt-listchanges/overwrite_etc_apt_listchanges_conf
Type: boolean
Default: true
Description: Should apt-listchanges overwrite your /etc/apt/listchanges.conf?
 apt-listchanges can configure all of the options in
 /etc/apt/listchanges.conf by asking you questions.  This file is read
 and processed every time apt-listchanges is run, and is used to set
 defaults.  All of the options can be overridden on the command line.
 .
 If you want to edit /etc/apt/listchanges.conf manually for whatever
 reason, answer "no" now.
Description-sv: Ska apt-listchanges skriva �ver din /etc/apt/listchanges.conf
 apt-listchanges kan konfigurera alla alternativ i /etc/apt/listchanges.conf
 genom att fr�ga dig fr�gor. Denna fil l�ses och behandlas vara g�ng
 apt-listchanges k�rs, och den anv�nds f�r att st�lla in normalv�rden.
 Alla alternativen kan �sidos�ttas p� kommandoraden.
