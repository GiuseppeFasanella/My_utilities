
[!alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/Networks/img/network_structure.png)

Procedendo da sinistra verso destra, ci sei tu da qualche parte del mondo (es. bruxelles) connesso alla rete INTERNET.
In Italia c'e' casa tua, con il tuo modem connesso anche lui alla rete internet. Al di sotto (gerarchicamente) del 
modem italiano ci sono diversi device (un pc, un raspberry ecc).

Il punto chiave da capire e' che tutti i device italiani si affacciano alla rete internet con un solo indirizzo IP
(che io chiamo IP esterno) che puoi ricavare andando su "what's my ip" associato al modem.

Se da riga di comando fai `ifconfig` ottieni gli indirizzi IP interni (inet address) dei vari device, che sono pero' visibili
solo all'interno delle rete garantita dal modem (quindi solo se sei su un device sottostante il modem in questione).

Tipicamente:

* INET device 1= 192.168....1
* INET device 2= 192.168....2
* INET device 3= 192.168....3

* IP esterno= 193.....

Se tu vuoi accedere da Bruxelles (ad esempio) a un device presente in Italia devi fare diverse cose
(qui mi occupo dei concetti, come farlo nella pratica e' spiegato nel README.md) :

0) devi accedere ai settings del modem e fare in modo che il device al quale vuoi approdare ottenga sempre lo stesso
inet address (cioe' devi associare a un indirizzo fisico (MAC address) sempre lo stesso IP interno)

1) devi sapere quale protocollo vuoi usare e la porta associata

* ssh usa (di default, ma la puoi cambiare) porta 22
* http usa la porta 80
* https usa la porta 443

2) Devi fare il port-forwarding: ovvero dire quando dall'esterno chiedo di "parlare" con l'IP esterno associato al modem, tramite
la porta specifica del protocollo che uso, in realta' intendo dire non l'IP esterno ma l'IP interno associato al device target.

Nella pratica devi fare una mappa del tipo:

193..... (ip esterno) interpellato tramite porta 80  VUOL DIRE 192.168.....1 (inet del device target) interpellato con porta 80

* 193..... : 80 --> 192.168....1: 80

(Le porte di ingresso/uscita possono essere anche diverse, purche' la regola sia ben definita)

2) L'IP esterno associato al modem e' dinamico (cioe' cambia nel tempo). Devi usare tool come no-ip che fanno una mappa:

* usersif.ddns.net VUOL DIRE 193....... e quando l'IP cambia usersif.ddns.net punta all'IP aggiornato


