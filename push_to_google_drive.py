# Google Developers Console                                                                                                                              
# Followed this link                                                                                                                                     
#https://medium.com/@annissouames99/how-to-upload-files-automatically-to-drive-with-python-ee19bb13dda                                                   
#pip install PyDrive is needed                                                                                                                           

from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive
import os
g_login = GoogleAuth()
g_login.LocalWebserverAuth()
drive = GoogleDrive(g_login)

with open("results/file_to_be_pushed","r") as file:
    file_drive = drive.CreateFile({'title':os.path.basename(file.name) })
    file_drive.SetContentString(file.read())
    file_drive.Upload()
