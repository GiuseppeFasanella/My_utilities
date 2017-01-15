Tu vuoi fare questo:

1) Fai partire una sinfonia mentre sei nel letto

2) Spegni lo schermo cosi' la luce non ti disturba --> ctrl + spazio (che chiama shut_off_monitor.sh)

3) Quando ti viene sonno, spegni il pc senza ri-accendere lo schermo --> ctrl + alt + spazio (che chiama shut_down.sh)

Nota: shut_down.sh fa 'sudo shutdown -h now'. Quindi, per fare in modo che l'utente comune, gfasanel nel mio caso, 

abbia i permessi di root per chiamare `shutdown -h now` devi fare cosi'

``` 
sudo visudo
#e aggiungere una riga finale
gfasanel ALL = NOPASSWD: /sbin/shutdown
```

Buon divertimento!
