#
# fill styles
# http://gnuplot.sourceforge.net/demo_4.6/fillstyle.html
require_relative "gpl"

# # E A Merritt <merritt@u.washington.edu>          24-Sep-2002
# #
# # Demo for revised fillstyle code selected by 
# # ./configure --enable-filledboxes --enable-relative-boxwidth
# #
# reset
# 
# set samples 25
# unset xtics
# unset ytics
# set yrange [0:120]
# 
# set title "A demonstration of boxes with default properties"
# plot [-10:10] 100/(1.0+x*x) title 'distribution' with boxes

gpl do
  reset
  set samples:25
  unset :xtics
  unset :ytics
  set yrange:0..120
  set title:"A demonstration of boxes with default properties"
  plot  -10..10,
    "100/(1.0+x*x)", title:'distribution', with:"boxes"
end

# set title "A demonstration of boxes with style fill solid 1.0"
# set style fill solid 1.0
# replot

gpl do
  set title:"A demonstration of boxes with style fill solid 1.0"
  set :style, fill_solid:1.0
  replot
end

# set title "A demonstration of boxes with style fill solid border -1"
# set style fill solid border -1
# replot

gpl do
  set title:"A demonstration of boxes with style fill solid border -1"
  set :style, :fill_solid, border:-1
  replot
end

# set title "Filled boxes of reduced width"
# set boxwidth 0.5 
# replot

gpl do
  set title:"Filled boxes of reduced width"
  set boxwidth:0.5
  replot
end

# set title "Filled boxes at 50% fill density"
# set style fill solid 0.25 border
# replot

gpl do
  set title:"Filled boxes at 50% fill density"
  set :style, fill_solid:0.25, border:true
  replot
end

# set title "A demonstration of boxes with style fill solid 0.25 noborder"
# set style fill solid 0.25 noborder
# replot

gpl do
  set title:"A demonstration of boxes with style fill solid 0.25 noborder"
  set :style, fill_solid:0.25, noborder:true
  replot
end

# set title "A demonstration of boxes in mono with style fill pattern"
# set samples 11
# set boxwidth 0.5 
# set style fill pattern border
# plot [-2.5:4.5] 100/(1.0+x*x) title 'pattern 0' with boxes lt -1, \
#                  80/(1.0+x*x) title 'pattern 1' with boxes lt -1, \
#                  40/(1.0+x*x) title 'pattern 2' with boxes lt -1, \
#                  20/(1.0+x*x) title 'pattern 3' with boxes lt -1

gpl do
  set title:"A demonstration of boxes in mono with style fill pattern"
  set samples:11
  set boxwidth:0.5
  set :style, :fill, :pattern, :border
  plot  -2.5..4.5,
    ["100/(1.0+x*x)", title:'pattern 0', with:"boxes", lt:-1],
    ["80/(1.0+x*x)", title:'pattern 1', with:"boxes", lt:-1],
    ["40/(1.0+x*x)", title:'pattern 2', with:"boxes", lt:-1],
    ["20/(1.0+x*x)", title:'pattern 3', with:"boxes", lt:-1]
end

