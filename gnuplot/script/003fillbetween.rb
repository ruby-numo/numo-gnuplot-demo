#
# fill between curves
# http://gnuplot.sourceforge.net/demo_4.6/fillbetween.html
require_relative "gpl"

# # Demonstrate filling the area between two curves
# # and also the application of fillstyle to filled curves.
# # Ethan Merritt  <merritt@u.washington.edu>
# # June 2004
# #
# set title "Fill area between two curves"
# set style data lines
# set xrange [10:*]
# set yrange [0:175]
# plot 'silver.dat' u 1:2:3 w filledcu, \
#       '' u 1:2 lt -1 notitle, '' u 1:3 lt -1 notitle

gpl do
  set title:"Fill area between two curves"
  set :style, :data, :lines
  set xrange:"[10:*]"
  set yrange:0..175
  plot ["'silver.dat'", u:[1,2,3], w:"filledcu"],
    ["''", u:[1,2], lt:-1, notitle:true],
    ["''", u:[1,3], lt:-1, notitle:true]
end

# set style fill pattern 2
# set title "Fill area between two curves (pattern fill)"
# replot

gpl do
  set :style, :fill, pattern:2
  set title:"Fill area between two curves (pattern fill)"
  replot
end

# set title "Fill area between two curves (above/below)"
# set style fill solid 1.0 noborder
# set xrange [250:500]
# set auto y
# plot 'silver.dat' u 1:2:($3+$1/50.) w filledcurves above title 'Above', \
#                '' u 1:2:($3+$1/50.) w filledcurves below title 'Below', \
# 	       '' u 1:2 lt -1 lw 2 title 'curve 1', \
# 	       '' u 1:($3+$1/50.) lt 3 lw 2 title 'curve 2'

gpl do
  set title:"Fill area between two curves (above/below)"
  set :style, fill_solid:1.0, noborder:true
  set xrange:250..500
  set auto:"y"
  plot ["'silver.dat'", u:'1:2:($3+$1/50.)', w:'filledcurves above', title:'Above'],
    ["''", u:'1:2:($3+$1/50.)', w:'filledcurves below', title:'Below'],
    ["''", u:[1,2], lt:-1, lw:2, title:'curve 1'],
    ["''", u:'1:($3+$1/50.)', lt:3, lw:2, title:'curve 2']
end

