#
# error bars
# http://gnuplot.sourceforge.net/demo_4.6/mgr.html
require_relative "gpl"

# print "Watch some  cubic splines"
# set samples 50
# set xlabel "Angle (deg)"
# set ylabel "Amplitude"
# set key box
# set title "Bragg reflection -- Peak only"
# plot "big_peak.dat" title "Rate" with errorbars, \
#                  "" smooth csplines t "Rate"

gpl do
  set samples:50
  set xlabel:"Angle (deg)"
  set ylabel:"Amplitude"
  set :key, :box
  set title:"Bragg reflection -- Peak only"
  plot ["\"big_peak.dat\"", title:"Rate", with:"errorbars"],
    ["\"\"", smooth:"csplines", t:"Rate"]
end

# set bars small
# replot

gpl do
  set bars:"small"
  replot
end

# set bars large
# #
# set samples 300
# set xlabel "Time (sec)"
# set ylabel "Rate"
# set title "Ag 108 decay data"
# plot "silver.dat" t "experimental" w errorb, \
#                ""  smooth csplines t "cubic smooth"

gpl do
  set bars:"large"
  set samples:300
  set xlabel:"Time (sec)"
  set ylabel:"Rate"
  set title:"Ag 108 decay data"
  plot ["\"silver.dat\"", t:"experimental", w:"errorb"],
    ["\"\"", smooth:"csplines", t:"cubic smooth"]
end

# # error is column 3; weight larger errors less
# # start with rel error = 1/($3/$2)
# S=1
# plot "silver.dat" t "experimental" w errorb,\
#                "" u 1:2:(S*$2/$3) smooth acsplines t "acspline Y/Z"

gpl do
  run "S=1"
  plot ["\"silver.dat\"", t:"experimental", w:"errorb"],
    ["\"\"", u:'1:2:(S*$2/$3)', smooth:"acsplines", t:"acspline Y/Z"]
end

# plot "silver.dat" t "rate" w errorb,\
#                "" u 1:2:($2/($3*1.e1)) sm acs t "acspline Y/(Z*1.e1)",\
#                "" u 1:2:($2/($3*1.e3)) sm acs t "         Y/(Z*1.e3)",\
#                "" u 1:2:($2/($3*1.e5)) sm acs t "         Y/(Z*1.e5)"

gpl do
  plot ["\"silver.dat\"", t:"rate", w:"errorb"],
    ["\"\"", u:'1:2:($2/($3*1.e1))', sm:"acs", t:"acspline Y/(Z*1.e1)"],
    ["\"\"", u:'1:2:($2/($3*1.e3))', sm:"acs", t:"         Y/(Z*1.e3)"],
    ["\"\"", u:'1:2:($2/($3*1.e5))', sm:"acs", t:"         Y/(Z*1.e5)"]
end

# set logscale y
# set grid x y mx my
# replot

gpl do
  set logscale:"y"
  set :grid, "x y mx my"
  replot
end

# unset logscale y
# plot "silver.dat" t "experimental" w errorb,\
#                "" smooth sbezier t "bezier"

gpl do
  unset logscale:"y"
  plot ["\"silver.dat\"", t:"experimental", w:"errorb"],
    ["\"\"", smooth:"sbezier", t:"bezier"]
end

# set logscale y
# plot "silver.dat" t "rate" w errorb, \
#                "" smooth sbezier t "bezier"

gpl do
  set logscale:"y"
  plot ["\"silver.dat\"", t:"rate", w:"errorb"],
    ["\"\"", smooth:"sbezier", t:"bezier"]
end

# set samples 100
# unset logscale
# unset grid
# set xlabel "Resistance [Ohm]"
# set ylabel "Power [W]"
# set title "UM1-Cell Power"
# n(x)=1.53**2*x/(5.67+x)**2
# plot [0:50] "battery.dat" t "Power" with xyerrorbars, n(x) t "Theory" w lines

gpl do
  set samples:100
  unset :logscale
  unset :grid
  set xlabel:"Resistance [Ohm]"
  set ylabel:"Power [W]"
  set title:"UM1-Cell Power"
  run "n(x)=1.53**2*x/(5.67+x)**2"
  plot  0..50,
    ["\"battery.dat\"", t:"Power", with:"xyerrorbars"],
    ["n(x)", t:"Theory", w:"lines"]
end

# plot [0:50] "battery.dat" t "Power" with boxxy, n(x) t "Theory" w lines

gpl do
  plot  0..50,
    ["\"battery.dat\"", t:"Power", with:"boxxy"],
    ["n(x)", t:"Theory", w:"lines"]
end

# plot [0:50] "battery.dat" u 1:2:3 t "Power" w xerr, n(x) t "Theory" w lines

gpl do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,3], t:"Power", w:"xerr"],
    ["n(x)", t:"Theory", w:"lines"]
end

# plot [0:50] "battery.dat" u 1:2:4 t "Power" w yerr, n(x) t "Theory" w lines

gpl do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,4], t:"Power", w:"yerr"],
    ["n(x)", t:"Theory", w:"lines"]
end

# set logscale y
# plot [0:50] "battery.dat" u 1:2:4 t "Power" w yerr, n(x) t "Theory" w lines

gpl do
  set logscale:"y"
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,4], t:"Power", w:"yerr"],
    ["n(x)", t:"Theory", w:"lines"]
end

# set logscale xy
# plot [1:50] "battery.dat" t "Power" w xyerr, n(x) t "Theory" w lines

gpl do
  set logscale:"xy"
  plot  1..50,
    ["\"battery.dat\"", t:"Power", w:"xyerr"],
    ["n(x)", t:"Theory", w:"lines"]
end

# unset logscale
# set bars small
# plot [0:50] "battery.dat" t "Power" with xyerrorbars, n(x) t "Theory" w lines

gpl do
  unset :logscale
  set bars:"small"
  plot  0..50,
    ["\"battery.dat\"", t:"Power", with:"xyerrorbars"],
    ["n(x)", t:"Theory", w:"lines"]
end

# plot [0:50] "battery.dat" u 1:2:3 t "Power" w xerr, n(x) t "Theory" w lines

gpl do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,3], t:"Power", w:"xerr"],
    ["n(x)", t:"Theory", w:"lines"]
end

# plot [0:50] "battery.dat" u 1:2:4 t "Power" w yerr, n(x) t "Theory" w lines

gpl do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,4], t:"Power", w:"yerr"],
    ["n(x)", t:"Theory", w:"lines"]
end

