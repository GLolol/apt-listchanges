Template: apt-listchanges/email-address
Type: string
Default: root
Description: To whom should apt-listchanges mail changelog entries?
 apt-listchanges can email a copy of displayed changelogs.  To what email
 address should they be sent?
 .
 Leave this empty if you do not want any email to be sent.
Description-pl: Do kogo apt-listchanges ma wysy�a� dzienniki zmian?
 apt-listchanges mo�e wysy�a� kopie wy�wietlanych dziennik�w zmian
 poczt� elektroniczn�. Pod jaki adres maj� by� wysy�ane?
 .
 Je�li listy nie powinny by� wysy�ane nale�y pozostawi� to pole puste.

Template: apt-listchanges/frontend
Type: select
Choices: pager, browser, xterm-pager, xterm-browser, text, mail, none
Choices-pl: pager, przegl�darka, pager w xtermie, przegl�darka w xtermie, tekst, poczta, nic
Default: pager
Description: How should changelogs be displayed with apt?
 apt-listchanges can display changelog entries in a number of different
 ways.
 .
 pager - Use your preferred pager
 .
 browser - Display HTML-formatted changelogs using a web browser
 .
 xterm-pager - Like pager, but in an xterm in the background
 .
 xterm-browser - Like browser, but in an xterm in the background
 .
 text  - Print changelogs to your terminal (without pausing)
 .
 mail  - Only send changelogs via mail
 .
 none  - Do not run automatically from apt
 .
 This setting can be overridden by a command-line option or an environment
 variable.  Note that you can still send a copy via mail with all of the
 frontends except 'none'.
Description-pl: Jak maj� by� wy�wietlane dzienniki zmian gdy u�ywany jest apt?
 apt-listchanges mo�e wy�wietla� dzienniki zmian na r�ne sposoby.
 .
 pager - u�ywa preferowanego programu stronicuj�cego (pagera)
 .
 przegl�darka - wy�wietla dzienniki skonwertowane do HTML w przegl�darce
 .
 pager w xtermie - pager uruchomiony w tle w emulatorze terminala
 .
 przegl�darka w xtermie - przegl�darka uruchomiona w tle w emulatorze terminala
 .
 tekst - wypisuje dzienniki zmian na terminalu (bez stronicowania)
 .
 poczta - wy��cznie wysy�a dzienniki poczt� elektroniczn�
 .
 nic - apt-listchanges nie jest uruchamiany automatycznie gdy uzywany jest apt
 .
 To ustawienie mo�na przes�oni� parametrem linii polece� lub zmienn� �rodowiska.
 Ka�da metoda opr�cz "nic" pozwala na wysy�anie kopii dziennik�w zmian poczt�.

Template: apt-listchanges/save-seen
Type: boolean
Default: true
Description: Should apt-listchanges skip changelogs that have already been seen?
 apt-listchanges has the capability to keep track of which changelog
 entries have already been displayed, and to skip them in future
 invocations. This is useful, for example, when retrying an upgrade.
Description-pl: Czy apt-listchanges ma pomija� wpisy ju� wcze�niej wy�wietlone?
 apt-listchanges mo�e �ledzi�, kt�re wpisy w dziennikach zmian zosta�y
 wcze�niej wy�wietlone i pomija� je przy kolejnych wywo�aniach.
 Jest to u�yteczne, na przyk�ad, przy wznawianiu uaktualnienia.

Template: apt-listchanges/confirm
Type: boolean
Default: true
Description: Should apt-listchanges prompt for confirmation after displaying changelogs?
 After giving you a chance to display changelog entries, apt-listchanges
 can ask whether or not you would like to continue. This is useful when
 running from apt, as it gives you a chance to abort the upgrade if you see
 a change you do not want to apply (yet).
 .
 This setting does not apply to the 'mail' or 'none' frontends, and can be
 overridden with a command line option.
Description-pl: Czy pyta� o potwierdzenie po wy�wietleniu dziennik�w zmian?
 Po wy�wietleniu dziennik�w zmian apt-listchanges mo�e pyta� o kontynuacj�
 dzia�ania.
 Jest to u�yteczne gdy apt-listchanges jest uruchamiany przez apt, gdy� daje
 mo�liwo�� przerwania uaktualniania w przypadku zauwa�enia zmian, kt�rych
 nie chce si� (na razie) wprowadza�.
 .
 To ustawienie nie dotyczy metod "poczta" i "nic". Mo�e by� ono przes�oni�te
 parametrem linii polece�.

Template: apt-listchanges/overwrite_etc_apt_listchanges_conf
Type: boolean
Default: true
Description: Should apt-listchanges overwrite your /etc/apt/listchanges.conf?
 apt-listchanges can configure all of the options in
 /etc/apt/listchanges.conf by asking you questions.  This file is read and
 processed every time apt-listchanges is run, and is used to set defaults.
 All of the options can be overridden on the command line.
 .
 If you want to edit /etc/apt/listchanges.conf manually for whatever
 reason, answer "no" now.
Description-pl: Czy nadpisywa� plik /etc/apt/listchanges.conf?
 apt-listchanges mo�e skonfigurowa� wszystkie swoje opcje zapisywane
 w /etc/apt/listchanges.conf zadaj�c pytania. Plik ten jest odczytywany
 przy ka�dym uruchomieniu apt-listchanges i u�ywany do ustalenia domy�lnych
 warto�ci opcji, jednak wszystkie opcje mog� by� ustalone z linii polece�.
 .
 Je�li z jakich� powod�w preferowana jest r�czna edycja pliku
 /etc/apt/listchanges.conf nale�y odpowiedzie� "nie".
