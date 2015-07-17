`tar -cvpzf backup.tar.gz cartella_di_cui_vuoi_fare_tar`

c significa "crea o sovrascrivi"

v per verbose

p significa "preserving permissions" utilissimo!

z comprimi

f per dare un nome all'output

.gz e' lo standard per dire "e' un tar compresso", anche detto "tarball". Un file "tar" e' non compresso 
(senza l'opzione z quando e' stato fatto), un "tarball" e' compresso (hai usato l'opzione "z")

`tar -cvpzf backup.tar.gz --exclude=cartella_che_non_vuoi cartella_di_cui_vuoi_fare_tar`

Quindi, per fare il backup del sito internet

**Comprimere**

`sudo tar -cvpzf backup.tar.gz /var/www`

**Decomprimere**

sudo tar -xvpzf backup.tar.gz -C /recover

x sta per "estrai"

-C /recover dice "voglio decomprimere tutto e dumparlo nella cartella /recover"

