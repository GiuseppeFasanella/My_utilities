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
Inserisci il file .htaccess in /var/www (semplicemente con emacs)

AuthUserFile /path/to/.htpasswd

AuthType Basic

AuthName "My Website"

Require valid-user`

.htpasswd NON va creato con emacs ma con questa procedura: messo fuori da /var/www/ (per sicurezza) e deve essere di questo tipo

# '-c' stands for 'create'.  Only to be used when creating a new .htpasswd file.
# You will be prompted for the password you would like to use after entering the command below.

htpasswd -c /usr/uj/jurbanek/.htpasswd john

Add existing one

# Notice there is no '-c' since the file exists already, we just want to add 'dave'
# You will be prompted for the password you would like to use after entering the command below.

htpasswd /usr/uj/jurbanek/.htpasswd dave

Esempi verosimili saranno

john:n5MfEoHOIQkKg
dave:9fluR/1n73p4c


