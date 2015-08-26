**Passo 1: Installa apache2**

sudo apt-get update

(per fare l'update delle tue repositories)

sudo apt-get install apache2

**Passo 2: Check if it works**

Apri il browser e scrivi `localhost` oppure `127.0.0.1` oppure l'inet address che ricavi da `ifconfig`: in tutti e
3 i casi sul browser ti deve apparire `it works`

Lui di fatto mostra a schermo il file index.html come pagina iniziale del tuo server appena creato. 
La cartella dove andranno inseriti i contenuti del server e' **/var/www/**

2) netstat -a | more

mostra tra le altre cose `www LISTEN`

3) netstat -an | more

mostra `80 LISTEN` 80 sarebbe la porta associata al protocollo http

**Start and stop**

sudo /etc/init.d/apache2 stop (oppure start)

**Passo 3: Port-forward della porta 80**

Accedi ai settings del router con `192.168.0.1` e forwarda la porta 80 all'inet address corrispondente al device server

A questo punto nel browser scriverai l'IP esterno associato al tuo modem. Siccome usi il browser usi il protocollo
http, quindi la porta 80 che e' forwardata all'inet interno associato al server. 
Risultato finisci sulla homepage `index.html` del tuo server

Con l'account **no-ip** del quale mi sono munito, invece che scrivere l'IP scrivo direttamente
`usersif.ddns.net` come url nel browser e ho fatto

**Passo 4: proteggere il proprio server**

Inserisci il file .htaccess in /var/www (semplicemente creandolo con emacs)

AuthUserFile /path/to/.htpasswd

AuthType Basic

AuthName "My Website"

Require valid-user`

* Crea .htpasswd cosi' (NON con emacs) e piazzalo fuori da /var/www/ (per sicurezza)

`htpasswd -c /path/to/.htpasswd john`

* '-c' stands for 'create'.  Only to be used when creating a new .htpasswd file.
* You will be prompted for the password you would like to use after entering the command below.

Add a user in an existing .htpasswd

`htpasswd /path/to/.htpasswd dave`

* Notice there is no '-c' since the file exists already, we just want to add 'dave'
* You will be prompted for the password you would like to use after entering the command below.

Nel file .htpasswd ti devi trovare qualcosa del genere

john:n5MfEoHOIQkKg

dave:9fluR/1n73p4c

* A questo punto, l'ultimo tocco e' modificare questo file
* sudo emacs /etc/apache2/sites-enabled/000-default

		AllowOverride All

In alternativa, Puoi lasciare Override None e poi ci mettere il contenuto di .htaccess direttamente in 000-default, eliminando cosi' del tutto il file .htaccess (ti servira' comunque il .htpasswd)

		AllowOverride None
		Order allow,deny
		allow from all
		AuthUserFile /home/gfasanel/.htpasswd
		AuthType Basic
		AuthName "My Website"
		Require valid-user
		

E' un buon sistema di protezione: resti scoperto solo al DOS (Denial of Services) Attack, cioe' sostanzialmente ti 
arrivano migliaia di richieste di accesso al tuo server e il server va busy e si spegne. A quel punto dovresti individuare l'IP o i diversi IP che ti mandano migliaia di richeste e bannarli.

La contromisura standard si chiama fail2ban (ma mo non esageriamo, chissenefrega se il raspberry si spegne)




