#
# binary data
# http://gnuplot.sourceforge.net/demo_4.6/binary.html
require_relative "gpl"

# set style data lines
# set hidden3d
# set title "Hidden line removal of explicit binary surfaces"
# set ticslevel 0
# set key box
# 
# set xrange [-3:3]
# set yrange [-2:2]
# splot "binary1" binary

gpl do
  set :style, :data, :lines
  set :hidden3d
  set title:"Hidden line removal of explicit binary surfaces"
  set ticslevel:0
  set :key, :box
  set xrange:-3..3
  set yrange:-2..2
  splot "\"binary1\"", :binary
end

# set view 70,45
# set xrange [-3:3]
# set yrange [-3:3]
# splot "binary2" binary

gpl do
  set view:[70,45]
  set xrange:-3..3
  set yrange:-3..3
  splot "\"binary2\"", :binary
end

# set title "Notice that sampling rate can change"
# set vi 70,10
# set xrange [-3:6]
# set yrange [-3:6]
# splot "binary3" binary

gpl do
  set title:"Notice that sampling rate can change"
  set vi:[70,10]
  set xrange:-3..6
  set yrange:-3..6
  splot "\"binary3\"", :binary
end

