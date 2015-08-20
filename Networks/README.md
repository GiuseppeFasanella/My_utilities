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

A questo punto **scopri qual e' il tuo indirizzo inet**:
* ifconfig | grep inet

e prova a connetterti tramite un dispositivo interno alla rete all'interno della quale si trova il server:

* `ssh -p 3500 gfasanel@192........` (Nota che stai esplicitamente chiedendo di fare ssh tramite la porta 3500)

Se tutto funziona, ti chiedera' la passwd e avrai accesso al server

### Parte 2: Accedere al server tramite un client remoto






Accedi al tuo router con
192.168.0.1
