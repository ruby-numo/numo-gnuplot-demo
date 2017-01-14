#
# axis ticmarks
# http://gnuplot.sourceforge.net/demo_4.6/tics.html
require_relative "gpl"

# # demo for tics settings
# 
# set xlabel "x"
# set ylabel "y"
# set mxtics
# 
# set title "Default tics settings"
# set xrange [-15:15]
# set yrange [-0.25:1]
# plot sin(sqrt(x**2))/sqrt(x**2) notitle

gpl do
  set xlabel:"x"
  set ylabel:"y"
  set :mxtics
  set title:"Default tics settings"
  set xrange:-15..15
  set yrange:-0.25..1
  plot "sin(sqrt(x**2))/sqrt(x**2)", :notitle
end

# set title "Different modification of tics settings"
# set tics scale 3,2 rotate by 45
# set xtics out offset 0,-1.0
# replot

gpl do
  set title:"Different modification of tics settings"
  set :tics, :scale, [3,2], rotate_by:45
  set :xtics, :out, offset:[0,-1.0]
  replot
end

# set xtics textcolor rgb "red" norotate
# set ytics rotate by 90 offset 2,0
# replot

gpl do
  set :xtics, :textcolor, rgb:"red", norotate:true
  set :ytics, :rotate, by:90, offset:[2,0]
  replot
end

# set title "Modification of tics settings (pm3d map with colorbar)"
# set pm3d map
# set border 4095
# set samples 25
# set isosamples 20
# set palette color positive
# set samples 50; set isosamples 50
# set tics norotate nooffset
# set cbtics in scale 4
# set xrange [-15:15]
# set yrange [-15:15]
# set zrange [-0.25:1]
# splot sin(sqrt(x**2+y**2))/sqrt(x**2+y**2) notitle

gpl do
  set title:"Modification of tics settings (pm3d map with colorbar)"
  set :pm3d, :map
  set border:4095
  set samples:25
  set isosamples:20
  set :palette, color:"positive"
  set samples:50; set isosamples:50
  set :tics, :norotate, :nooffset
  set :cbtics, :in, scale:4
  set xrange:-15..15
  set yrange:-15..15
  set zrange:-0.25..1
  splot "sin(sqrt(x**2+y**2))/sqrt(x**2+y**2)", :notitle
end

