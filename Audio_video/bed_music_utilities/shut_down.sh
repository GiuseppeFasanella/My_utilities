#handle this script via keyboard-binding                                        
killall -9 vlc
killall -9 totem #totem is the default player in ubuntu                         
xset dpms force off #This to shut off the monitore, otherwise it will re-appear
#Now shut down the pc                                                           
sudo shutdown -h now #To make this work you have to add a line in 'sudo visudo'
