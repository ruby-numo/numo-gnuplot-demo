#
# step functions
# http://gnuplot.sourceforge.net/demo_4.6/steps.html
require_relative "gpl"

# # This file will serve as the datafile used in demonstrating the 
# # "plot with steps" option.   Here is a gnuplot input file
# # which uses "plot with steps", inverse error function, normal
# # distribution function, and the inverse normal distribution
# # function.
# 
# set title "Compare steps, fsteps and histeps"
# plot [0:12][0:13] "steps.dat" notitle with points,  \
#  "steps.dat" title 'steps' with steps, \
#  'steps.dat' title 'fsteps' with fsteps, \
#  'steps.dat' title 'histeps' with histeps

gpl do
  set title:"Compare steps, fsteps and histeps"
  plot  0..12, 0..13,
    ["\"steps.dat\"", :notitle, with:"points"],
    ["\"steps.dat\"", title:'steps', with:"steps"],
    ["'steps.dat'", title:'fsteps', with:"fsteps"],
    ["'steps.dat'", title:'histeps', with:"histeps"]
end

# set title "Histogram built from unsorted data by 'smooth frequency'"
# set ylabel 'counts per bin'
# set xlabel 'bins'
# plot 'hemisphr.dat' u (floor($1*20)):(1) smooth frequency with histeps

gpl do
  set title:"Histogram built from unsorted data by 'smooth frequency'"
  set ylabel:'counts per bin'
  set xlabel:'bins'
  plot "'hemisphr.dat'", u:'(floor($1*20)):(1)', smooth:"frequency", with:"histeps"
end

# unset xlabel
# unset ylabel
# 
# set title "Normal Distribution Function"
# plot [-3:3][0:1] norm(x)

gpl do
  unset :xlabel
  unset :ylabel
  set title:"Normal Distribution Function"
  plot  -3..3, 0..1,
    "norm(x)"
end

# set title "Inverse Error Function"
# plot [-1:1] inverf(x)

gpl do
  set title:"Inverse Error Function"
  plot  -1..1,
    "inverf(x)"
end

# set title "Inverse Normal Distribution Function"
# plot [0:1] invnorm(x)

gpl do
  set title:"Inverse Normal Distribution Function"
  plot  0..1,
    "invnorm(x)"
end

