#! /bin/bash                                                                                                                                                                     
cd Scrivania
##df -aTH #lista i device montati                                                                                                                                                
mv /media/SanDisk/Scrivania_pc_backup/*.tar.gz /media/SanDisk/Scrivania_pc_backup/temp/
echo "backup of Dipho"
tar czf /media/SanDisk/Scrivania_pc_backup/Dipho.tar.gz Dipho
echo "backup of ecalelf_run2"
tar czf /media/SanDisk/Scrivania_pc_backup/ecalelf_run2.tar.gz ecalelf_run2
echo "backup of Zprime"
tar czf /media/SanDisk/Scrivania_pc_backup/Zprime.tar.gz Zprime
echo "backup of Latex"
tar czf /media/SanDisk/Scrivania_pc_backup/Latex.tar.gz Latex
echo "backup of latex_progetti"
tar czf /media/SanDisk/Scrivania_pc_backup/latex_progetti.tar.gz latex_progetti;

