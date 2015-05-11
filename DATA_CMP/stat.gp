#!/usr/bin/gnuplot
reset
set terminal png
set output "Stats.png"
set boxwidth 0.75 absolute
set xtic auto # set xtics automatically
set ytic auto # set ytics automatically
set title "Comparaison entre MPI et MPI-OpenMP (4096 Corps)"
set xlabel "Nombre de Processus et Threads"
set ylabel "Temps (s)"
set label "Yield Point" at 0.003,260
set arrow from 0.0028,250 to 0.003,280
set xr [4:16]
set yr [0.00:0.05]
plot "stat.dat" using 1:2 title 'MPI' with linespoints, \
     "stat.dat" using 1:3 title 'MPI-OpenMP' with linespoints
