set datafile separator ','
set term x11 0
plot 'gps_position.csv' using 7:8 with linespoints
set term x11 1
plot 'gps_position.csv' using 9 with linespoints
set term x11 2
plot 'velocity.csv' using (sqrt($5*$5 + $6*$6 + $7*$7))  with linespoints
