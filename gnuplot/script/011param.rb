#
# parametric functions
# http://gnuplot.sourceforge.net/demo_4.6/param.html
require_relative "gpl"

# # Show some of the new parametric capabilities.
# #
# set parametric
# set dummy t
# set autoscale
# set samples 160
# set title ""
# set key box
# set key below
# plot t,sin(t)/t title "t,sin(t)/t or sin(x)/x"

gpl do
  set :parametric
  set :dummy, t_nq:''
  set :autoscale
  set samples:160
  set title:""
  set :key, :box
  set :key, "below"
  plot "t",
    ["sin(t)/t", title:"t,sin(t)/t or sin(x)/x"]
end

# plot sin(t)/t,t

gpl do
  plot "sin(t)/t",
    "t"
end

# plot sin(t),cos(t)

gpl do
  plot "sin(t)",
    "cos(t)"
end

# set xrange [-3:3]
# set yrange [-3:3]
# set title "Parametric Conic Sections"
# plot -t,t,cos(t),cos(2*t),2*cos(t),sin(t),-cosh(t),sinh(t)

gpl do
  set xrange:-3..3
  set yrange:-3..3
  set title:"Parametric Conic Sections"
  plot "-t",
    "t",
    "cos(t)",
    "cos(2*t)",
    "2*cos(t)",
    "sin(t)",
    "-cosh(t)",
    "sinh(t)"
end

# set title ""
# 
# set xrange [-5:5]
# set yrange [-5:5]
# plot tan(t),t,t,tan(t)

gpl do
  set title:""
  set xrange:-5..5
  set yrange:-5..5
  plot "tan(t)",
    "t",
    "t",
    "tan(t)"
end

# set trange [0.00001:3]
# plot t,log(t),-t,log(t),sin(t),t**2,-sin(t),t**2

gpl do
  set trange:0.00001..3
  plot "t",
    "log(t)",
    "-t",
    "log(t)",
    "sin(t)",
    "t**2",
    "-sin(t)",
    "t**2"
end

# set autoscale x
# set yrange [-1.5:1.5]
# set trange [0.0001:10*pi]
# plot sin(t)/t,cos(t)/t

gpl do
  set autoscale:"x"
  set yrange:-1.5..1.5
  set trange:"[0.0001:10*pi]"
  plot "sin(t)/t",
    "cos(t)/t"
end

