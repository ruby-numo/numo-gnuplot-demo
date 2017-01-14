#
# pm3d gamma
# http://gnuplot.sourceforge.net/demo_4.6/pm3dgamma.html
require_relative "gpl"

# # Test of gamma correction for gray palettes
# 
# set pm3d; set palette
# set palette gray
# set pm3d map
# set cbrange [-10:10]
# set xrange [-10:10]
# set yrange [*:*]
# unset ztics
# unset ytics
# set samples 101
# set isosamples 2
# set xtics 2
# 
# set palette gamma 0.75
# set title "gamma = 0.75"
# splot x

gpl do
  set :pm3d; set :palette
  set :palette, "gray"
  set :pm3d, :map
  set cbrange:-10..10
  set xrange:-10..10
  set yrange:"[*:*]"
  unset :ztics
  unset :ytics
  set samples:101
  set isosamples:2
  set xtics:2
  set :palette, gamma:0.75
  set title:"gamma = 0.75"
  splot "x"
end

# set palette gamma 1.0
# set title "gamma = 1.0"
# splot x

gpl do
  set :palette, gamma:1.0
  set title:"gamma = 1.0"
  splot "x"
end

# set palette gamma 1.25 
# set title "gamma = 1.25"
# splot x

gpl do
  set :palette, gamma:1.25
  set title:"gamma = 1.25"
  splot "x"
end

# set palette gamma 1.5
# set title "gamma = 1.5"
# splot x

gpl do
  set :palette, gamma:1.5
  set title:"gamma = 1.5"
  splot "x"
end

# set palette gamma 1.75
# set title "gamma = 1.75"
# splot x

gpl do
  set :palette, gamma:1.75
  set title:"gamma = 1.75"
  splot "x"
end

# set palette gamma 2.0
# set title "gamma = 2.0"
# splot x

gpl do
  set :palette, gamma:2.0
  set title:"gamma = 2.0"
  splot "x"
end

