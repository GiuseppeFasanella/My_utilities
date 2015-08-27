E' piu' complicato di quanto pensassi: i concetti coinvolti sono 3:

1) SMTP e' il server che spedisce le mail (e sul quale ti sei loggato per accedervi)

2) MTA e' il Transfer AGENT che prende in consegna le mail

A volta 1) e 2) sono uno stesso server fisico, ma concettualmente sono due cose diverse

3) Il server di approdo (tipicamente IMAP o POP), che riceve la mail che hai spedito


![alt tag](https://github.com/GiuseppeFasanella/My_utilities/blob/master/Networks/img/mail_structure.png)


Spedire una mail da riga di comando non e' tanto semplice quindi, perche' devi configurare il tutto in modo o da essere 
loggato su un SMTP specifico da cui puoi spedire le mail, oppure essere in qualche modo legato a un IMAP (quello di gmail ad esempio)
e spedire mail al solo gmail a quel punto (In quel caso pero' non avresti bisogno di autenticazione).

Tool utili sono SENDMAIL (una sorta di wrapper per tutto questo) e SMARTHOST.
