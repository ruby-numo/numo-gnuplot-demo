#
# simple functions
# http://gnuplot.sourceforge.net/demo_4.6/simple.html
require_relative "gpl"

# # Requires data files "[123].dat" from this directory,
# # so change current working directory to this directory before running.
# # gnuplot> set term <term-type>
# # gnuplot> load 'simple.dem'
# #
# set key left box
# set samples 50
# plot [-10:10] sin(x),atan(x),cos(atan(x))

gpl do
  set :key, :left, :box
  set samples:50
  plot  -10..10,
    "sin(x)",
    "atan(x)",
    "cos(atan(x))"
end

# set key right nobox
# set samples 100
# plot [-pi/2:pi] cos(x),-(sin(x) > sin(x+1) ? sin(x) : sin(x+1))

gpl do
  set :key, :right, :nobox
  set samples:100
  plot "[-pi/2:pi]",
    "cos(x)",
    "-(sin(x) > sin(x+1) ? sin(x) : sin(x+1))"
end

# set key left box
# set samples 200
# plot [-3:5] asin(x),acos(x)

gpl do
  set :key, :left, :box
  set samples:200
  plot  -3..5,
    "asin(x)",
    "acos(x)"
end

# plot [-30:20] besj0(x)*0.12e1 with impulses, (x**besj0(x))-2.5 with points

gpl do
  plot  -30..20,
    ["besj0(x)*0.12e1", with:"impulses"],
    ["(x**besj0(x))-2.5", with:"points"]
end

# set samples 400
# plot [-10:10] real(sin(x)**besj0(x))

gpl do
  set samples:400
  plot  -10..10,
    "real(sin(x)**besj0(x))"
end

# set key bmargin center horizontal
# plot [-5*pi:5*pi] [-5:5] real(tan(x)/atan(x)), 1/x

gpl do
  set :key, :bmargin, :center, :horizontal
  plot "[-5*pi:5*pi]", -5..5,
    "real(tan(x)/atan(x))",
    "1/x"
end

# set key left box
# set autoscale
# set samples 800
# plot [-30:20] sin(x*20)*atan(x)

gpl do
  set :key, :left, :box
  set :autoscale
  set samples:800
  plot  -30..20,
    "sin(x*20)*atan(x)"
end

# plot [-19:19] '1.dat' with impulses, '2.dat', '3.dat' with lines

gpl do
  plot  -19..19,
    ["'1.dat'", with:"impulses"],
    "'2.dat'",
    ["'3.dat'", with:"lines"]
end

