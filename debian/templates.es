Template: apt-listchanges/apt-hook-p
Type: boolean
Default: true
Description: Should apt-listchanges be automatically run by apt?
 One way to use apt-listchanges is to configure apt to run apt-listchanges
 on packages that have been downloaded for installation or upgrade.  This
 way, each time you perform an installation or upgrade using apt,
 apt-listchanges will show you the changes that are about to be made to
 your system. 
 .
 I can perform this configuration for you if you like.  Since you can also
 run apt-listchanges manually on .deb archives, this step is optional. 
Description-es: �Quieres que apt ejecute apt-listchanges autom�ticamente?
 Una manera de usar apt-listchanges es configurar apt para que lo ejecute
 sobre los paquetes que se han descargado para su instalaci�n o
 actualizaci�n.  De esta manera, cada vez que actualizas o instalas paquetes
 usando apt, apt-listchanges mostrar� los cambios que se van a suceder en tu
 sistema.
 .
 Si lo deseas, puedo modificar la configuraci�n para t�.  Como tambi�n se
 puede usar apt-listchanges sobre archivos .deb, este paso es opcional.

Template: apt-listchanges/frontend
Type: select
Choices: pager, xterm-pager, newt, text, mail
Choices-es: paginador, paginador-xterm, newt, texto, correo
Default: pager
Description: How should changelogs be displayed by default?
 apt-listchanges can display changelog entries in a number of different
 ways. 
 .
 pager - Use your preferred pager 
 .
 xterm-pager - Use your preferred pager in an xterm in the background 
 .
 newt - Use a terminal graphics interface, using text-mode windows (you
 will need to install libnewt-perl to use this) 
 .
 text  - Print changelogs to your terminal (without pausing) 
 .
 mail  - Send changelogs via email (you will be prompted for an address) 
 .
 This setting can be overridden by a command-line option. 
Description-es: �C�mo quieres que se muestren los changelogs por defecto?
 apt-listchanges puede mostrar los changelogs de varias maneras.
 .
 paginador - Usa tu paginador preferido
 .
 paginador-xterm - Usa tu paginador preferido sobre una xterm en el fondo
 .
 newt - Usa un interfaz de gr�ficos en terminal, usando ventanas en modo
 texto (necesitar�s instalar libnewt-perl para usar esto)
 .
 texto - Imprime los changelogs en tu terminal (sin hacer ninguna pausa)
 .
 correo - Env�a los changelogs por correo (se te preguntar� una direcci�n)
 .
 Puedes reemplazar esta configuraci�n usando una opci�n en la l�nea de
 comandos.

Template: apt-listchanges/email-address
Type: string
Default: root
Description: To whom should apt-listchanges mail changelog entries?
 You have chosen to have changelog entries sent via email.  To what email
 address should they be sent? 
Description-es: �A qui�n debe enviar los changelogs apt-listchanges?
 Has elegido enviar los changelogs por correo.  �A qu� direcci�n de correo
 quieres que sean enviados?

Template: apt-listchanges/confirm
Type: boolean
Default: true
Description: Should apt-listchanges prompt for confirmation after displaying changelogs?
 After giving you a chance to display changelog entries, apt-listchanges
 can ask whether or not you would like to continue. This is useful when
 running from apt, as it gives you a chance to abort the upgrade if you see
 a change you do not want to apply (yet). 
 .
 This setting only applies when running from apt.  Otherwise, it can be
 requested with a command line option. 
Description-es: �Deber�a apt-listchanges pedir confirmaci�n despu�s de mostrar los changelogs?
 Despu�s de darte la oportunidad de mostrar los changelogs, apt-listchanges
 puede preguntar si quieres o no continuar. �sto es �til cuando se ejecuta
 desde apt, ya que te da la oportunidad de abortar la actualizaci�n si ves
 alg�n cambio que no quieres aplicar (todav�a).

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
Description-es: �Deber�a apt-listchanges sobreescribir /etc/apt/listchanges.conf?
 apt-listchanges puede configurar todas las opciones en
 /etc/apt/listchanges.conf preguntandote preguntas.  Este archivo es le�do y
 procesado cada vez que se ejecuta apt-listchages, y se usa para establecer
 opciones por defecto. Todas las opciones pueden reemplazarse en la l�nea de
 comando.
 .
 Si quieres editar /etc/apt/listchanges.conf manualmente por alguna raz�n,
 contesta "no" ahora.
