#
# discrete contours
# http://gnuplot.sourceforge.net/demo_4.6/discrete.html
require_relative "gpl"

# set contour
# set title "Demo of specifying discrete contour levels  -  default contours"
# splot x*y

gpl do
  set :contour
  set title:"Demo of specifying discrete contour levels  -  default contours"
  splot "x*y"
end

# #set discrete levels
# set cntrparam levels discrete 0, 15, 75
# set title "3 discrete contours at 0 15 & 75"
# replot

gpl do
  set :cntrparam, :levels, discrete:[0,15,75]
  set title:"3 discrete contours at 0 15 & 75"
  replot
end

# #set incremental levels
# set cntrp level incr -20, 5, 9
# set title "9 incremental contours starting at -20, stepping by 5"
# replot

gpl do
  set :cntrp, :level, incr:[-20,5,9]
  set title:"9 incremental contours starting at -20, stepping by 5"
  replot
end

