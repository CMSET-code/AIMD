# Gnuplot script to plot atom trajectory coordinates vs time
set terminal pngcairo size 1200,800 enhanced font 'Arial,12'
set output 'atom_trajectory_plots.png'

# Set multiplot layout
set multiplot layout 2,2 title "Atom 3 Trajectory Analysis" font 'Arial,14'

# Common settings
set xlabel "Time (steps)"
set grid

# Plot 1: X coordinate vs time
set title "X Coordinate vs Time"
set ylabel "X Coordinate (Å)"
plot 'trajectory_atom_3_X.dat' using 1:2 with lines linewidth 2 linecolor rgb "red" title "X coordinate"

# Plot 2: Y coordinate vs time  
set title "Y Coordinate vs Time"
set ylabel "Y Coordinate (Å)"
plot 'trajectory_atom_3_Y.dat' using 1:2 with lines linewidth 2 linecolor rgb "blue" title "Y coordinate"

# Plot 3: Z coordinate vs time
set title "Z Coordinate vs Time"
set ylabel "Z Coordinate (Å)"
plot 'trajectory_atom_3_Z.dat' using 1:2 with lines linewidth 2 linecolor rgb "green" title "Z coordinate"

# Plot 4: Combined distance R vs time
set title "Combined Distance R vs Time"
set ylabel "Distance R (Å)"

# Get initial coordinates from first line of each file
X0 = 10.068570  # From your data - first X value
Y0 = 8.725276   # Replace with actual first Y value from trajectory_atom_3_Y.dat
Z0 = 9.583117   # Replace with actual first Z value from trajectory_atom_3_Z.dat

# If you don't know Y0 and Z0, use this method to extract them:
# First, let's create a combined file and use it directly
system("paste trajectory_atom_13_X.dat trajectory_atom_13_Y.dat trajectory_atom_13_Z.dat > combined_trajectory.dat")

# Now plot R directly from the combined file
plot 'combined_trajectory.dat' using 1:(sqrt(($2-X0)**2 + ($4-Y0)**2 + ($6-Z0)**2)) with lines linewidth 2 linecolor rgb "purple" title "R = sqrt(ΔX²+ΔY²+ΔZ²)"

unset multiplot

# Also create individual plots for better quality
set terminal pngcairo size 800,600 enhanced font 'Arial,12'

# Individual plot for all coordinates together
set output 'all_coordinates.png'
set title "All Coordinates vs Time for Atom 3"
set ylabel "Coordinate (Å)"
plot 'trajectory_atom_3_X.dat' using 1:2 with lines linewidth 2 linecolor rgb "red" title "X", \
     'trajectory_atom_3_Y.dat' using 1:2 with lines linewidth 2 linecolor rgb "blue" title "Y", \
     'trajectory_atom_3_Z.dat' using 1:2 with lines linewidth 2 linecolor rgb "green" title "Z"

# Individual plot for R
set output 'combined_distance.png'
set title "Combined Distance R vs Time for Atom 3"
set ylabel "Distance R (Å)"
plot 'combined_trajectory.dat' using 1:(sqrt(($2-X0)**2 + ($4-Y0)**2 + ($6-Z0)**2)) with lines linewidth 2 linecolor rgb "purple" title "R = sqrt(ΔX²+ΔY²+ΔZ²)"

# Clean up
system("rm -f combined_trajectory.dat")

print "Plots generated:"
print "1. atom_trajectory_plots.png - 2x2 layout with all plots"
print "2. all_coordinates.png - All coordinates on same plot" 
print "3. combined_distance.png - Combined distance R only"
