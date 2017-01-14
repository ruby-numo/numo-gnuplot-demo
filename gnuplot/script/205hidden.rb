#
# hidden surfaces
# http://gnuplot.sourceforge.net/demo_4.6/hidden.html
require_relative "gpl"

# set samples 20
# set isosamples 20
# set hidden3d
# set title "Hidden line removal of explicit surfaces"
# 
# set xrange [-3:3]
# set yrange [-2:2]
# splot 1 / (x*x + y*y + 1)

gpl do
  set samples:20
  set isosamples:20
  set :hidden3d
  set title:"Hidden line removal of explicit surfaces"
  set xrange:-3..3
  set yrange:-2..2
  splot "1 / (x*x + y*y + 1)"
end

# set xrange [-1:1]
# set yrange [-1:1]
# splot x*y / (x**2 + y**2 + 0.1)

gpl do
  set xrange:-1..1
  set yrange:-1..1
  splot "x*y / (x**2 + y**2 + 0.1)"
end

# set view 70,45
# unset contour
# set xrange [-3:3]
# set yrange [-3:3]
# splot sin(x*x + y*y) / (x*x + y*y)

gpl do
  set view:[70,45]
  unset :contour
  set xrange:-3..3
  set yrange:-3..3
  splot "sin(x*x + y*y) / (x*x + y*y)"
end

# set view 60,30
# set xrange [-3:3]
# set yrange [-3:3]
# set zrange [-1:1]
# set ztics -1,0.5,1
# set grid z
# set border 4095
# splot sin(x) * cos(y)

gpl do
  set view:[60,30]
  set xrange:-3..3
  set yrange:-3..3
  set zrange:-1..1
  set ztics:[-1,0.5,1]
  set grid:"z"
  set border:4095
  splot "sin(x) * cos(y)"
end

# unset grid
# set ztics autofreq
# set border 31
# set view 75,230
# set contour
# replot

gpl do
  unset :grid
  set ztics:"autofreq"
  set border:31
  set view:[75,230]
  set :contour
  replot
end

# set view 80,30,1,1
# set style data lines
# # autoranging loses the verticals
# set xrange [0:15]
# set yrange [0:15]
# splot "glass.dat" using 1

gpl do
  set view:[80,30,1,1]
  set :style, :data, :lines
  set xrange:0..15
  set yrange:0..15
  splot "\"glass.dat\"", using:1
end

# set view 50
# set grid
# replot

gpl do
  set view:50
  set :grid
  replot
end

