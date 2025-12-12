# basic_distance_plot.gnuplot
set terminal pngcairo enhanced font "Arial,12" size 1000,600
set output 'distance_plot.png'

set title 'Interatomic Distance Evolution'
set xlabel 'Time (ps)'
set ylabel 'Distance (Å)'
set grid

# Set nice colors
set style line 1 lc rgb '#1f77b4' lw 2
set style line 2 lc rgb '#ff7f0e' lw 2
set style line 3 lc rgb '#2ca02c' lw 2
set style line 4 lc rgb '#d62728' lw 2
set style line 5 lc rgb '#9467bd' lw 2

plot 'distance_7_13.dat' using 1:2 with lines ls 1 title 'Atoms 1-2'
