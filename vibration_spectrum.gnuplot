# basic_spectrum_plot.gnuplot
set terminal pngcairo enhanced font "Arial,12" size 1000,600
set output 'vibration_spectrum_basic.png'

set title 'Vibrational Spectrum'
set xlabel 'Frequency (cm⁻¹)'
set ylabel 'Intensity (arb. units)'
set grid

# Set reasonable x-range for vibrations
set xrange [0:4000]

# Style for spectrum
set style line 1 lc rgb '#1f77b4' lw 2

plot 'vibration_spectrum.dat' using 1:2 with lines ls 1 title 'Vibrational Spectrum'
