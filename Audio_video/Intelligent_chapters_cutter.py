import matplotlib.pyplot as plt
import os
import numpy as np
import scipy.io.wavfile
import os.path


'''
L'idea qui e' semplice:
1. Ridurre il numero di sample per secondo in modo da lavorare con array "piccoli": O(60k). 
Per fare questo prima prendo tutto il sample e poi re-samplo io 4 volte al secondo
In questo modo un tipico audiolibro di 7 ore --> data  = array di 100k numeri.

2. Trova le posizioni in data dove ci sono vari zeri di fila, preceduti e seguiti da 1 (ossia i silenzi tra un capitolo 
e l'altro)

3. Ordino questi supposti silenzi in lunghezza. Si spera che i silenzi piu' lunghi siano davvero quelli tra un capitolo
e l'altro, e non e.g. le pause per prendere fiato.

4. Funziona abbastanza bene, bisogna ancora lavorare per creare una struttura piu' flessibile in cui l'utente puo' dire
"guarda, tagliami da qui a qui". Questa volta nei capitoli tagliati male, ho fatto stampare a schermo i silenzi e poi 
con mplayer -ss xx capitolo.mp3 ho sentito quale tra questi era la vera fine capitolo. Si potrebbe migliorare, ma gia' mi piace
abbastanza.
'''

#Ci vuole una opzione per stampare a schermo dove deve tagliare
#audio_file = 'test.wav'
all = -1
audio_file_originale = '2_9_lavorare.mp3' ##audio file mp3 che vuoi tagliare
audio_file = audio_file_originale.split(".")[0]+".wav" #audio file wav su cui vuoi lavorare
#numero di capitoli attesi
n_chapters = 5
n_chapters -=1 #numero di silenzi attesi

if audio_file_originale.split(".")[1] != 'wav' and not os.path.exists(audio_file):
    #if not a wav file, convert it to wav to use scipy utils.
    os.system("ffmpeg -i "+audio_file_originale+" -vn -acodec pcm_s16le -ac 1 -ar 44000 -f wav "+audio_file)
    
samplerate, data = scipy.io.wavfile.read(audio_file)
samplerate_divider = 11000.
samplerate = int(samplerate/samplerate_divider)
data = data[0: len(data): int(samplerate_divider)]
#plt.plot(data) #waveform
#print(len(data))

if len(data) > 100000:
    print("La lunghezza di questo file audio e' troppo grande")
    print("riduci il numero di sample per secondo, trova i silenzi e poi taglia il file originale full quality")
    exit(0)

#data = [1, 2, 3, 0,0,0,1,2,3,4,0,0,1,2,3,4,5,0,0,0,0]
def zero_runs(a):
    # Create an array that is 1 where a is 0, and pad each end with an extra 0.
    iszero = np.concatenate(([0], np.equal(a, 0).view(np.int8), [0]))
    absdiff = np.abs(np.diff(iszero))
    # Runs start and end where absdiff is 1.
    ranges = np.where(absdiff == 1)[0].reshape(-1, 2) ##Originale
    return ranges

def len_zero_runs(a):
    iszero = np.concatenate(([0], np.equal(a, 0).view(np.int8), [0]))
    absdiff = np.abs(np.diff(iszero))
    ranges = np.where(absdiff == 1) 
    ranges = np.diff(ranges)[0]
    ranges = ranges[0:len(ranges):2] #list[start:stop:step]
    return ranges

def sorted_lens(a):
    sorted_lens = list(np.argsort(len_runs))
    sorted_lens.reverse()
    return sorted_lens

runs = zero_runs(data) #tutti i chunk che contengono silenzi
len_runs = len_zero_runs(data)
sort_lens = sorted_lens(len_runs)

starts = []
ends = []

for i in range(0,n_chapters): #prendo i primi n_chapters silenzi piu' lunghi
    start = runs[sort_lens[i]][0]/(1.*samplerate) #start
    end = runs[sort_lens[i]][1]/(1.*samplerate) #end
    starts.append(start)
    ends.append(end)

print("La lunghezza del file e': "+str(len(data)/(1.*samplerate)))
print(starts)
print(ends)

starts.append(0.0) #beginning of the audio track
ends.append(len(data)/(1.*samplerate)) #end of the audio track
starts = list(set(starts))
ends = list(set(ends))
starts = sorted(starts)
ends = sorted(ends)
if len(ends) == len(starts) + 1:
    starts.append(ends[-2])
    
print(starts)
print(ends)
print('Ispeziona cosi')
print("mplayer -ss 633 3_2_lavorare.mp3")
assert len(starts)==len(ends)

print('**************************')
print('Qui si comincia a dividere')
print('**************************')

if all==-1:
    for i in range(len(starts)):
        os.system("ffmpeg -i "+audio_file+" -ss "+str(starts[i])+" -to "+str(ends[i])+" "+audio_file.split(".")[0]+"_"+str(i)+".mp3")
else:
    ## Da lavorarci
    i=all #basically you can cherry pick the i that you want to cut
    os.system("ffmpeg -i "+audio_file+" -ss "+str(starts[i])+" -to "+str(ends[i])+" "+audio_file.split(".")[0]+"_"+str(i)+".mp3")

#f.write('ffmpeg -i "%s" -ss %f -to %f -c copy -y "%s-p%04d.mp3"\r\n' % (src, opos, apos, src, part))
