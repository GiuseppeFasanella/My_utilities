#! /bin/bash                                                                                                                                                                     
cd Scrivania
##df -aTH #lista i device montati                                                                                                                                                
mv /media/SanDisk/Scrivania_pc_backup/*.tar.gz /media/SanDisk/Scrivania_pc_backup/temp/
echo "backup of Latex"
tar czf /media/SanDisk/Scrivania_pc_backup/Latex.tar.gz Latex
echo "backup of latex_progetti"
tar czf /media/SanDisk/Scrivania_pc_backup/latex_progetti.tar.gz latex_progetti;

