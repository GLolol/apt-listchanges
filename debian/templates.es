Template: apt-listchanges/frontend
Type: select
Choices: pager, xterm-pager, text, mail, none
Choices-es: paginador, paginador-xterm, texto, correo, ninguna
Default: pager
Description: How should changelogs be displayed with apt?
 apt-listchanges can display changelog entries in a number of different
 ways.
 .
 pager - Use your preferred pager
 .
 xterm-pager - Use your preferred pager in an xterm in the background
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
Description-es: �C�mo quiere que se muestren las bit�coras (logs) con apt?
 apt-listchanges puede mostrar las bit�coras de varias maneras.
 .
 paginador - Usa su paginador preferido
 .
 paginador-xterm - Usa su paginador preferido sobre una xterm
 .
 texto   - Imprime las bit�coras en su terminal (sin hacer ninguna pausa)
 .
 correo  - S�lo env�a las bit�coras por correo
 .
 ninguno - No ejecutar autom�ticamente desde apt
 .
 Puede reemplazar esta configuraci�n usando una opci�n en la l�nea de
 comandos o con una variable de entorno. Tenga en cuenta que a�n as� se
 puede mandar una copia por correo habiendo seleccionado cualquiera de
 las maneras de mostrar las bit�coras, excepto con �ninguna�.

Template: apt-listchanges/email-address
Type: string
Default: root
Description: To whom should apt-listchanges mail changelog entries?
 apt-listchanges can email a copy of displayed changelogs.  To what email
 address should they be sent?
 .
 Leave this empty if you do not want any email to be sent.
Description-es: �A qui�n debe apt-listchanges enviar las bit�coras?
 apt-listchanges puede enviar una copia de las bit�coras mostradas. �A qu�
 direcci�n de correo quiere que se env�en?

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
Description-es: �Deber�a apt-listchanges pedir confirmaci�n despu�s de mostrar las bit�coras?
 Despu�s de darle la oportunidad de mostrar las bit�coras, apt-listchanges
 puede preguntar si quiere o no continuar. �sto es �til cuando se ejecuta
 desde apt, ya que le ofrece la oportunidad de abortar la actualizaci�n si
 ve alg�n cambio que no quiere aplicar (a�n).
 .
 Esta opci�n no afecta a las maneras de mostrar las bit�coras �correo� o
 �ninguna� y se puede reemplazar desde la l�nea de comandos.

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
 /etc/apt/listchanges.conf haci�ndole preguntas.  Este fichero se lee y
 procesa cada vez que se ejecuta apt-listchanges, y se usa para
 establecer opciones por defecto. Todas las opciones pueden reemplazarse
 en la l�nea de comandos.
 .
 Si quiere editar /etc/apt/listchanges.conf manualmente por alguna raz�n,
 conteste �no� ahora.

Template: apt-listchanges/save-seen
Type: boolean
Default: true
Description: Should apt-listchanges skip changelogs that have already been seen?
 apt-listchanges has the capability to keep track of which changelog
 entries have already been displayed, and to skip them in future
 invocations. This is useful, for example, when retrying an upgrade.
Description-es: �Deber�a apt-listchanges ignorar los cambios que ya se han visto?
 apt-listchanges puede hacer un seguimiento de las bit�coras que ya se han
 mostrado anteriormente, e ignorarlas en futuras ejecuciones. Esto
 es �til, por ejemplo, cuando se reintenta una actualizaci�n.
