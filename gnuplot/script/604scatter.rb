#
# non-gridded data
# http://gnuplot.sourceforge.net/demo_4.6/scatter.html
require_relative "gpl"

# # Simple demo of scatter data conversion to grid data.
# #
# 
# set title "Simple demo of scatter data conversion to grid data"
# unset hidden3d
# set ticslevel 0.5
# set view 60,30
# set autoscale
# set parametric
# set style data points
# set xlabel "data style point - no dgrid"
# set key box
# splot "hemisphr.dat"

gpl do
  set title:"Simple demo of scatter data conversion to grid data"
  unset :hidden3d
  set ticslevel:0.5
  set view:[60,30]
  set :autoscale
  set :parametric
  set :style, :data, :points
  set xlabel:"data style point - no dgrid"
  set :key, :box
  splot "\"hemisphr.dat\""
end

# set dgrid3d 10,10,1
# set xlabel " data style lines, dgrid3d 10,10,1"
# set style data lines
# splot "hemisphr.dat"

gpl do
  set dgrid3d:[10,10,1]
  set xlabel:" data style lines, dgrid3d 10,10,1"
  set :style, :data, :lines
  splot "\"hemisphr.dat\""
end

# set dgrid3d ,,4
# set xlabel " data style lines, dgrid3d ,,4 "
# set style data lines
# splot "hemisphr.dat"

gpl do
  set dgrid3d:",,4"
  set xlabel:" data style lines, dgrid3d ,,4 "
  set :style, :data, :lines
  splot "\"hemisphr.dat\""
end

# set dgrid3d ,,16
# set xlabel " data style lines, dgrid3d ,,16"
# set style data lines
# splot "hemisphr.dat"

gpl do
  set dgrid3d:",,16"
  set xlabel:" data style lines, dgrid3d ,,16"
  set :style, :data, :lines
  splot "\"hemisphr.dat\""
end

# set contour
# set xlabel "data style lines, dgrid3d ,,16, contour"
# splot "hemisphr.dat"

gpl do
  set :contour
  set xlabel:"data style lines, dgrid3d ,,16, contour"
  splot "\"hemisphr.dat\""
end

# unset dgrid3d
# set style data points
# set xlabel "data style points, nodgrid3d"
# splot "scatter2.dat"

gpl do
  unset :dgrid3d
  set :style, :data, :points
  set xlabel:"data style points, nodgrid3d"
  splot "\"scatter2.dat\""
end

# set key nobox
# set dgrid3d ,,1
# set xlabel "data style lines, dgrid3d ,,1"
# set style data lines
# splot "scatter2.dat"

gpl do
  set :key, :nobox
  set dgrid3d:",,1"
  set xlabel:"data style lines, dgrid3d ,,1"
  set :style, :data, :lines
  splot "\"scatter2.dat\""
end

# set dgrid3d ,,4
# set xlabel "data style lines, dgrid3d ,,4"
# set style data lines
# splot "scatter2.dat"

gpl do
  set dgrid3d:",,4"
  set xlabel:"data style lines, dgrid3d ,,4"
  set :style, :data, :lines
  splot "\"scatter2.dat\""
end

