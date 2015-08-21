##Come accedere da remoto a un computer server

### Parte 1: Cambiare la porta di default ssh

**Sul computer server va installato `openssh-server`**
* `sudo apt-get install openssh-server`
* Al che controlla che sshd stia girando: `ps -e | grep sshd`

**Di default ssh usa la porta 22**, cosi' come http usa di default la porta 80 ecc..

Per rendere piu' difficile un attacco informatico cambia la porta associata a ssh. Ci sono, in particolare, 65535 porte disponibili, di cui le prime 1024 sono riservate per protocolli specifici (tipo appunto la 22 e' per ssh)

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






Accedi al tuo router con
192.168.0.1
