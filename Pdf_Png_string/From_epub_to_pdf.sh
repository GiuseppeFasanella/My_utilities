#1. Apri calibre e converti da epub a pdf
# Ci sara' un problema di margini: il pdf convertito non li possiede: occorre darglieli
#pdfjam --scale '0.8' libro.pdf

## 2. Versione molto piu' comoda. Chiama da riga di comando calibre direttamente.
ebook-convert Doctor_Fauses.epub Doctor_Faustus.pdf
#pdfjam --scale '0.8' Doctor_Faustus.pdf ##Scala se vuoi lasciarti spazio per le note
