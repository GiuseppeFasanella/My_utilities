sudo apt-get update

(per fare l'update delle tue repositories)

sudo apt-get install apache2

**Check if it works**

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

