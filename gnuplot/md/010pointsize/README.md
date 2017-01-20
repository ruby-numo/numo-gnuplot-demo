## variable size points
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/pointsize.html)

### 1

```ruby
# # Read individual point sizes from extra column of input file
# # Ethan A Merritt - October 2004
# #
# unset key
# unset border
# unset yzeroaxis
# unset xtics
# unset ytics
# unset ztics
# 
# #
# # plot a 2D map with locations marked by variable sized points
# #
# set title "plot with variable size points"
# plot 'world.dat' with lines lt 3, \
#      'world.cor' using 1:2:(5.*rand(0)) with points lt 1 pt 6 ps variable

Numo.gnuplot do
  unset :key
  unset :border
  unset :yzeroaxis
  unset :xtics
  unset :ytics
  unset :ztics
  set title:"plot with variable size points"
  plot ["'world.dat'", with:"lines", lt:3],
    ["'world.cor'", using:'1:2:(5.*rand(0))', with:"points", lt:1, pt:6, ps:"variable"]
end
```
![010pointsize/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/010pointsize/image/001.png)

### 2

```ruby
# set title "splot with variable size points\nit is possible to specify size and color separately"
# set view map
# unset hidden3d
# splot 'world.dat' using 1:2:(0) with lines lt 3, \
#       'world.cor' using 1:2:(0.5-rand(0)):(5.*rand(0)) with points pt 5 ps var lt palette

Numo.gnuplot do
  set title:"splot with variable size points\nit is possible to specify size and color separately"
  set view:'map'
  unset :hidden3d
  splot ["'world.dat'", using:'1:2:(0)', with:"lines", lt:3],
    ["'world.cor'", using:'1:2:(0.5-rand(0)):(5.*rand(0))', with:"points", pt:5, ps:"var", lt:true, palette:true]
end
```
![010pointsize/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/010pointsize/image/002.png)

### 3

```ruby
# # plot a '3D version using spherical coordinate system' of the world.
# set angles degrees
# set title "3D version using spherical coordinate system"
# set ticslevel 0
# set view 70,40,0.8,1.2
# set mapping spherical
# set parametric
# set samples 32
# set isosamples 9
# set urange [-90:90]
# set vrange [0:360]
# splot cos(u)*cos(v),cos(u)*sin(v),sin(u) with lines lt 5,\
#       'world.dat' with lines lt 3, \
#       'world.cor' using 1:2:(1):(5.*rand(0)) with points lt 1 pt 6 ps variable

Numo.gnuplot do
  set angles:"degrees"
  set title:"3D version using spherical coordinate system"
  set ticslevel:0
  set view:[70,40,0.8,1.2]
  set mapping:"spherical"
  set :parametric
  set samples:32
  set isosamples:9
  set urange:-90..90
  set vrange:0..360
  splot "cos(u)*cos(v)",
    "cos(u)*sin(v)",
    ["sin(u)", with:"lines", lt:5],
    ["'world.dat'", with:"lines", lt:3],
    ["'world.cor'", using:'1:2:(1):(5.*rand(0))', with:"points", lt:1, pt:6, ps:"variable"]
end
```
![010pointsize/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/010pointsize/image/003.png)

### 4

```ruby
# # hidden3d still not working fully
# # pointsize is now handled, but axes are never obscured
# # 
# set title "3D solid version through hiddenlining"
# set hidden3d
# set arrow from 0,0,-1.2 to 0,0,1.2 lt 5 lw 2
# set arrow from -1.2, 0, 0 to 1.2, 0, 0 nohead lt 5 lw 1 
# set arrow from 0, -1.2, 0 to 0, 1.2, 0 nohead lt 5 lw 1
# splot cos(u)*cos(v),-cos(u)*sin(v),sin(u) with lines lt 5,\
#       'world.dat' u 1:2:(1.001) with lines lt 3, \
#       'world.cor' using 1:2:(1):(5.*rand(0))  with points lt 1 pt 6 ps var

Numo.gnuplot do
  set title:"3D solid version through hiddenlining"
  set :hidden3d
  set :arrow, from:[0,0,-1.2], to:[0,0,1.2], lt:5, lw:2
  set :arrow, from:[-1.2,0,0], to:[1.2,0,0], nohead:true, lt:5, lw:1
  set :arrow, from:[0,-1.2,0], to:[0,1.2,0], nohead:true, lt:5, lw:1
  splot "cos(u)*cos(v)",
    "-cos(u)*sin(v)",
    ["sin(u)", with:"lines", lt:5],
    ["'world.dat'", u:'1:2:(1.001)', with:"lines", lt:3],
    ["'world.cor'", using:'1:2:(1):(5.*rand(0))', with:"points", lt:1, pt:6, ps:"var"]
end
```
![010pointsize/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/010pointsize/image/004.png)
