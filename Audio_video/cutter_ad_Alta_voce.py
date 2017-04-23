#!/usr/bin/env python
import os,sys 
from optparse import OptionParser

parser=OptionParser()
parser.add_option("-F","--file",dest="File")
(options,args)=parser.parse_args()

print "****************FILE TO CUT: ",options.File
print "****************FILE EXTENSION is: ",options.File.split(".")[1]


file_name=options.File.split(".")[0]
def cutter(*arg):
    print "I was called with", len(arg), "argumets:", arg
    for i in range(0,len(arg)-1):
        os.system("ffmpeg -i "+options.File+" -ss "+arg[i]+" -to "+arg[i+1]+" -c copy cut_"+str(file_name)+"_"+str(i)+".mp3")
def merger(length):
    file_to_add=[]
    for i in range(0,length -1):
        if(i%2): 
            file_to_add.append("cut_"+str(file_name)+"_"+str(i)+".mp3")
            #i deve essere dispari, 
            #perche' se e' pari e' un file di musica di merda 
            #che mi rovina l'ascolto dell'audiolibro

    files_to_merge=' '.join(map(str,file_to_add))
    print files_to_merge
    os.system("cat "+str(files_to_merge)+">"+str(options.File.split(".")[0])+"_cut.mp3")

def cut_and_merge(*arg):
    cutter(*arg)
    merger(len(arg))


###########################MAIN BODY##############################
#Il primo punto sara' sempre l'inizio della traccia, quindi "0:00"
#Il secondo punto sara' sempre la fine della musichetta cretina di ad alta voce, quindi "0:17"
#L'ultimo punto sara' sempre la fine della traccia, quindi varia, diciamo "35:00" 
cut_and_merge("0:00","0:17","2:45","5:07","8:06","11:24","15:41","19:38","23:14","35:00")
os.system("rm cut_*.mp3") #clean partial files
