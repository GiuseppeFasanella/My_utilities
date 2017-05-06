#!/usr/bin/env python
import os,sys 
from optparse import OptionParser

parser=OptionParser()
parser.add_option("-F","--file",dest="File")
parser.add_option("-C","--clean",action="store_true")
(options,args)=parser.parse_args()

def cutter(*arg):
    print "I was called with", len(arg), "argumets:", arg
    for i in range(0,len(arg)-1):
        os.system("ffmpeg -i "+options.File+" -ss "+arg[i]+" -to "+arg[i+1]+" -c copy cut_"+str(file_name)+"_"+str(i)+".mp3")
def merger(length):
    file_to_add=[]
    #for i in range(0,length -1):
    for i in range(2,length -1):
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
if not options.clean:
    print "****************FILE TO CUT: ",options.File
    print "****************FILE EXTENSION is: ",options.File.split(".")[1]
    file_name=options.File.split(".")[0]
    os.system("rm cut_*.mp3") #clean partial files
#Il primo punto sara' sempre l'inizio della traccia, quindi "0:00"
#Il secondo punto sara' sempre la fine della musichetta cretina di ad alta voce, quindi "0:17"
#L'ultimo punto sara' sempre la fine della traccia, quindi varia, diciamo "35:00" 
#cut_and_merge("0:00","0:17","3:40","7:07","12:06","14:07","16:30","19:08","22:41","35:00")##6
#cut_and_merge("0:00","0:17","3:02","6:01","08:32","11:10","17:40","20:51","24:33","35:00")##7
#cut_and_merge("0:00","0:17","3:15","5:27","09:20","10:46","15:09","17:47","22:52","35:00")##8
    #cut_and_merge("0:00","0:17","3:23","5:36","09:29","11:51","15:09","18:07","22:51","35:00")##9
    #cut_and_merge("0:00","0:17","4:29","7:33","11:19","12:35","17:33","20:54","25:07","35:00")##10
    #cut_and_merge("0:00","0:17","5:18","6:46","10:03","13:29","16:01","19:36","22:54","35:00")##11
    #cut_and_merge("0:00","0:17","4:04","7:28","11:38","12:55","15:06","18:25","23:13","35:00")##12
    #cut_and_merge("0:00","0:17","4:29","5:39","08:40","11:33","16:05","19:30","23:42","35:00")##13
    #cut_and_merge("0:00","0:17","4:23","6:49","10:46","14:35","17:55","21:06","24:05","35:00")##14
    #cut_and_merge("0:00","0:17","3:57","7:16","11:57","14:06","19:01","21:56","24:06","35:00")##15
    #cut_and_merge("0:00","0:17","2:33","5:44","9:04","11:09","14:52","18:52","22:57","35:00")##16
    #cut_and_merge("0:00","0:17","3:40","5:25","7:45","09:09","11:18","15:00","20:58","35:00")##17
    #cut_and_merge("0:00","0:17","4:08","6:28","10:50","14:08","17:20","20:48","23:47","35:00")##18
    #cut_and_merge("0:00","0:17","4:11","6:20","11:09","11:37","14:40","16:33","23:22","35:00")##19
    #cut_and_merge("0:00","0:17","4:20","6:05","09:43","12:16","17:18","20:34","25:34","35:00")##20
    cut_and_merge("0:00","0:17","5:44","8:10","11:36","12:48","18:43","22:10","24:41","35:00")##1
    #cut_and_merge("0:00","0:17","4:08","8:07","11:30","13:53","19:01","22:30","25:45","35:00")##2
    #cut_and_merge("0:00","0:17","3:26","7:00","10:36","13:15","17:48","21:01","24:27","35:00")##3
    #cut_and_merge("0:00","0:17","4:11","7:37","12:18","14:59","18:55","21:25","24:54","35:00")##4
###########################CLEAN##############################
if options.clean:
    os.system("rm cut_*.mp3") #clean partial files
    os.system("mv "+options.File+" con_musica_fatti/") #mv files with music
