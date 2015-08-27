0) Un tunnel si fa quando per motivi tuoi vuoi essere visto dalla rete internet con un certo IP che non e' quello dal
quale ti stai connettendo.

0a) Se hai "accesso ssh" a un certo server, puoi fare un tunnel a quel server e quindi "acquisire" il suo IP 

1) Aprire il tunnel: 

`ssh -D 15000 m6.iihe.ac.be`

Ho scelto di aprire il tunnel dalla porta 15000

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/Networks/img/tunnel.png)

2) Per controllare se la porta e' in ascolto:

`netstat -avlptun | grep 15000`

e vedi qualcosa del tipo `127.0.0.1: 15000 LISTEN 4697/ssh`, dove `127.0.0.1` sei tu, col tuo device

3) A questo punto devi dire al browser: fammi il tunnel

* O aggiungi un proxy a mano e lo imposti manualmente (e lo disimposti quando chiudi la connessione ssh)
* Oppure, meglio ancora, se hai google-chrome prenditi il plug-in "foxy proxy". E' molto meglio perche' con un clic gli dici 
" attiva il proxy", "disattiva il proxy", "usa il proxy solo per alcuni URL" ec...

Per impostare foxy proxy, in Host or IP Address scrivi `localhost:15000` e lui capira' da solo e si scrivera'
`localhost` `port| 15000` 

4) A questo punto se vai su what's my ip vedrai che non e' piu' visto il tuo IP, ma l'IP del server verso il quale
hai fatto tunnel

4plus) Se hai l'IP e vuoi sapere il nome del server

`nslookup 188.184....`


