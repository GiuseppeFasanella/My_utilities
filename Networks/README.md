##Come accedere da remoto a un computer server

### Parte 1: Cambiare la porta di default ssh

**Sul computer server va installato `openssh-server`**
* `sudo apt-get install openssh-server`
* Al che controlla che sshd stia girando: `ps -e | grep sshd`

**Di default ssh usa la porta 22**, cosi' come http usa di default la porta 80 ecc..

Per rendere piu' difficile un attacco informatico cambia la porta associata a ssh. Ci sono, in particolare, 65535 porte disponibili, di cui le prime 1024 sono riservate per protocolli specifici (tipo appunto la 22 e' per ssh, la porta 80 e' per http)

**Cambiare la porta associata a ssh**

* sudo emacs /etc/ssh/sshd_config
* Modica la riga "What ports, IPs and protocols we listen for" da Port 22 -> `Port 3500` (ad esempio)

Per rendere operativa la modifica della porta, **killa e fai ripartire sshd**:

* sudo killall sshd
* sudo /etc/init.d/ssh start

A questo punto **scopri qual e' il tuo indirizzo inet** (l'indirizzo del server all'interno della rete domestica):
* ifconfig | grep inet

e prova a connetterti tramite un dispositivo interno alla rete all'interno della quale si trova il server (perche' **all'esterno tutti i dispositivi si affacciano con un solo indirizzo IP** e quindi non puoi connetterti al volo con questa semplice procedura. D'altronde se l'ho chiamata parte 1 c'e' un motivo):

* `ssh -p 3500 gfasanel@192........` (Nota che stai esplicitamente chiedendo di fare ssh tramite la porta 3500)
* `ssh -p 3500 pi@192.....`

Se tutto funziona, ti chiedera' la passwd e avrai accesso al server

**Extra (io non ho avuto bisogno di farlo)**
Potresti dever aprire la porta scelta per ssh nel tuo firewall e potrebbe anche essere comodo installare firestarter.

`sudo apt-get install firestarter`

Policy tab->Inbound Traffic Policy->Allow Service|Port|For ->Add Rule->Metti porta e ssh come nome->Everyone->Add

### Parte 1.1: Prima di rendere disponibile il server alla rete internet, cura un po' la sicurezza
Modifica ssh_config aggiungendo quale cavillo in piu'

* sudo emacs /etc/ssh/sshd_config

* Protocol 2 #usera' il protocollo ssh2 (piu' sicuro)
* PermitRootLogin no # non potrai loggarti come root 
* AllowUsers pi # puoi fare ssh solo verso l'utente pi del server

Per rendere operativa le modifiche apportate, **killa e fai ripartire sshd**:

* sudo killall sshd
* sudo /etc/init.d/ssh start

### Parte 2: Accedere al server tramite un client remoto, non presente sullo stesso network del server

**Passo 2.1**: Devi essere sicuro che **il server acquisisca sempre lo stesso inet address** nella rete domestica (quello che ricavi da `ifconfig` per capirci), altrimenti ogni volta che connetterai il server sulla rete domestica,
questo prendera' un inet diverso (cosi' funziona il protocollo DHCP).

L'esatta procedura e' router-specific, ma l'idea e' sempre quella

* Accedi ai settings del tuo router inserendo `192.168.0.1` nella barra degli indirizzi del browser
* Nel mio caso, sotto *Mode expert* ho trovato **Assigner une IP fixe a' une adresse MAC**. Dove qui, tanto per aumentare la confusione, per IP intende IP della rete interna, diverso per ogni device connesso al router. Tutti i dispositivi pero' escono sulla rete internet globale con un solo IP che e' quello del router.
* Per scoprire qual e' il MAC address del server, al solito uso `ifconfig` e cerca `HWAdr`: troverai una cosa tipo `00:13:ef:70:02...`
* A questo punto devi aggiungere la regola "Questo MAC address 00:13:ef:.... deve sempre prendersi questo inet 192.168.0.4 (ad esempio)"

**Possibile problema**: alcuni router non hanno questa funzione. A quel punto occorre installare un firmware come DD-WRT. Cerca Chadwick Wachs "tutorial for setting up static leases in DD-WRT"
