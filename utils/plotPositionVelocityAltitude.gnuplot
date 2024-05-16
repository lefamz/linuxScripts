set datafile separator ','
set term x11 0
plot 'gps_position.csv' using 16:17 with linespoints
set term x11 1
plot 'gps_position.csv' using 18 with linespoints
set term x11 2
plot 'velocity.csv' using (sqrt($14*$14 + $15*$15 + $16*$16))  with linespoints
