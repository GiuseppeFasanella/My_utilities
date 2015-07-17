**Problema e'**

* unkown filesystem, press any key to continue
* Al che non succede un cazzo
* error: hd0 out of disk
* `grub rescue>`

grub e' il boot loader di ubuntu e attraverso di esso viene avviato il sistema operativo S.O. 

(La schermata normale di grub sarebbe quella per scegliere il S.O. se windows o ubuntu)

`grub rescue` ha un certo numero di comandi utili. La procedura da fare e'

* `ls` mostra i dischi che hai

`(hd0) (hd0,msdos5) .... (hd0,msdos1)`

Dove si vede che ho un solo disco con 5 partizioni. Devi capire su quale partizione si trova il sistema operativo.

* `ls (hd0,msdos5)` e' lui!

* `set` controlla i settaggi di grub, per vedere in quale partizione di hd0 e' cercato il S.O.

Se i settaggi sono errati, settali nel modo giusto

* `set prefix=(hd0,msdos5)/boot/grub`
* `set root=(hd0,msdos5)`

Adesso carichiamo i moduli

* `insmod (hd0,msdos5)/boot/grub/linux.mod`
* `linux /vmlinuz root=/dev/sda5 ro`
* `initrd /initrd.img`
* `boot`


