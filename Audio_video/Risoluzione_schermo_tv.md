## Capire quale uscita video sto usando
xrandr -q
==> scoperto che si tratta di DP-2 crei una nuovo "modo di risoluzione" e lo applichi
xrandr --newmode "1800x1012_60.00" 151.42 1800 1912 2104 2408 1012 1013 1016 1048 -HSync +Vsync
xrandr --addmode DP-2 "1800x1012_60.00"
xrandr --output DP-2 --mode "1800x1012_60.00"
