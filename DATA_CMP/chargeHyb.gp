#!/usr/bin/gnuplot
reset
set terminal png
set output "chargeHyb.png"
set boxwidth 0.75 absolute
set xtic auto # set xtics automatically
set ytic auto # set ytics automatically
set title "Montée en charge MPI-OpenMP (4 machines 16 threads)"
set xlabel "Nombre de Corps"
set ylabel "Temps (s)"
set label "Yield Point" at 0.003,260
set arrow from 0.0028,250 to 0.003,280
set xr [64:262144]
set yr [0.00:27.00]
plot "chargeHyb.dat" using 1:2 title 'Temps' with linespoints
