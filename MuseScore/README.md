### Procedura standard

* Crea un modello -> Piano -> 2 battute; **NON** dare nessun titolo in modo da poter ritagliare correttamente il pdf in seguito con `pdfcrop`

* Scrivi il tuo esempio musicale (piu' sotto c'e' la sintassi di *Musescore* che uso di solito; In questa repo c'e' anche il manuale in pdf di Musescore)

* Salva l'esempio in .mscz (vedi [prova.mscz] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/prova.mscz))

* Ctrl+p e lo printi in pdf (vedi [prova.pdf] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/prova.pdf))

* Ritaglia tutto lo spazio bianco del pdf usando `cropper_pdf.sh esempio.` (il `.` non e' essenziale ma usando `TAB` viene scritto al volo e lo script e' pensato in modo che tu non debba cancellare il punto, qualora ci fosse nel nome del file. **NON** scrivere pero' **esempio.pdf**). Vedi ad esempio come viene [prova-crop.pdf] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/prova-crop.pdf)

* Se hai bisogno di fare modifiche al pdf (tipo commenti, cerchietti) puoi usare `xournal` o `pdfedit` 

### I Comandi che uso piu' di frequente sono:

* Abbiamo detto Modello->Piano->2 Battute; NON dare un titolo al brano
* Clicca su `N`: modalita' inserimento note]
* Inserisci le note con il mouse **SENZA** curarti delle legature (quelle vanno inserite dopo)
* Per modificare la disposizione della stanghetta usa `x` o `Maiusc+x`

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/img/stanghetta.png)

**Due voci che eseguono la stessa nota**

Voglio questo, per capirci

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/img/voci.png)

o meglio ancora questo

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/img/voglio_questo.png)

* Passo 1: **Scrivi le voci esterne** quindi baritono e basso

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/img/passo1.png)

* Passo 2: **cambia voce e scrivi la nota raddoppiata**; Seleziona `voce 1` (riquadri colorati in alto a destra)
 e riscrivi la nota che vuoi raddoppiare (non vedrai nessun cambiamento)

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/img/passo2.png)

* Passo 3: **cambia ancora voce e finisci**
* Passo 4: Esci dalla modalita' inserimento note; Doppio clic sulla nota raddoppiato e sposta la nota verso destra o sinistra con le frecce della tastiera

**Inserire terzine/gruppi irregolari**

![alt tag] (https://github.com/GiuseppeFasanella/My_utilities/blob/master/MuseScore/img/gruppi_irregolari.png)
