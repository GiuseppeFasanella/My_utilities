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



