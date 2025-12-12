# displacement_plots.gnuplot
set terminal pngcairo enhanced font "Arial,12" size 1200,800
set output 'displacement_analysis.png'

set multiplot layout 2,2 title "Displacement Analysis"

# MSD plot
set title "Mean Squared Displacement"
set xlabel "Time (ps)"
set ylabel "MSD (Å²)"
plot 'displacement_analysis.dat' using 1:2 with lines lw 2 title 'MSD'

# RMSD plot  
set title "Root Mean Square Displacement"
set xlabel "Time (ps)"
set ylabel "RMSD (Å)"
plot 'displacement_analysis.dat' using 1:3 with lines lw 2 title 'RMSD'

# D(t) plot
set title "Diffusion Coefficient D(t)"
set xlabel "Time (ps)"
set ylabel "D(t) (cm²/s)"
plot 'displacement_analysis.dat' using 1:4 with lines lw 2 title 'D(t)'

# Log-log MSD
set title "MSD (log-log)"
set xlabel "Time (ps)"
set ylabel "MSD (Å²)"
set logscale xy
plot 'displacement_analysis.dat' using 1:2 with lines lw 2 title 'MSD'

unset multiplot
