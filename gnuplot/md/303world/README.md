## cylindrical/spherical
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/world.html)

### 1

```ruby
# set title "Gnuplot Correspondences"
# unset key
# unset border
# unset yzeroaxis
# unset xtics
# unset ytics
# #
# # plot world map and correspondent locations as a +
# plot 'world.dat' with lines lt 3 , 'world.cor' with points lt 1 pt 2

Numo.gnuplot do
  set title:"Gnuplot Correspondences"
  unset :key
  unset :border
  unset :yzeroaxis
  unset :xtics
  unset :ytics
  plot ["'world.dat'", with:"lines", lt:3],
    ["'world.cor'", with:"points", lt:1, pt:2]
end
```
![303world/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/303world/image/001.png)

### 2

```ruby
# set title ""
# set key on
# set border
# set yzeroaxis
# set xtics
# set ytics
# #
# # plot a '3D version using spherical coordinate system' of the world.
# reset
# unset key
# set border
# set yzeroaxis
# set xtics
# set ytics
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
# splot cos(u)*cos(v),cos(u)*sin(v),sin(u) with lines lc rgb "cyan" ,\
# 'world.dat' with lines lc rgb "blue" , 'world.cor' with points lt 1 pt 2

Numo.gnuplot do
  set title:""
  set :key, :on
  set :border
  set :yzeroaxis
  set :xtics
  set :ytics
  reset
  unset :key
  set :border
  set :yzeroaxis
  set :xtics
  set :ytics
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
    ["sin(u)", with:"lines", lc_rgb:"cyan"],
    ["'world.dat'", with:"lines", lc_rgb:"blue"],
    ["'world.cor'", with:"points", lt:1, pt:2]
end
```
![303world/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/303world/image/002.png)

### 3

```ruby
# # HBB 20000715: new demo:
# # same plot, but with hidden3d active, plus axes through the
# # poles:
# set title "3D solid version with hidden line removal"
# set hidden3d offset 0
# set arrow from 0,0,-1.2 to 0,0,1.2 lc rgb "cyan" lw 2
# set arrow from -1.2, 0, 0 to 1.2, 0, 0 nohead lc rgb "cyan" lw 1
# set arrow from 0, -1.2, 0 to 0, 1.2, 0 nohead lc rgb "cyan" lw 1
# splot cos(u)*cos(v),-cos(u)*sin(v),sin(u) with lines lc rgb "cyan" ,\
# 'world.dat' u 1:2:(1.001) with lines lc rgb "blue" , 'world.cor' with points lt 1 pt 2

Numo.gnuplot do
  set title:"3D solid version with hidden line removal"
  set :hidden3d, :offset, 0
  set :arrow, from:[0,0,-1.2], to:[0,0,1.2], lc_rgb:"cyan", lw:2
  set :arrow, from:[-1.2,0,0], to:[1.2,0,0], nohead:true, lc_rgb:"cyan", lw:1
  set :arrow, from:[0,-1.2,0], to:[0,1.2,0], nohead:true, lc_rgb:"cyan", lw:1
  splot "cos(u)*cos(v)",
    "-cos(u)*sin(v)",
    ["sin(u)", with:"lines", lc_rgb:"cyan"],
    ["'world.dat'", u:'1:2:(1.001)', with:"lines", lc_rgb:"blue"],
    ["'world.cor'", with:"points", lt:1, pt:2]
end
```
![303world/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/303world/image/003.png)

### 4

```ruby
# unset arrow
#
# #
# # plot a '3D version using cylindrical coordinate system' of the world.
# set title "3D version using cylindrical coordinate system"
# set ticslevel 0.0
# set view 70,40,0.8,1.2
# set mapping cylindrical
# set parametric
# set samples 32
# set isosamples 13
# set urange [-180:180]
# set vrange [-90:90]
# splot cos(u),sin(u),v with lines lc rgb "cyan" ,\
# 'world.dat' with lines lc rgb "blue" lw 2, 'world.cor' with points lt 1 pt 2

Numo.gnuplot do
  unset :arrow
  set title:"3D version using cylindrical coordinate system"
  set ticslevel:0.0
  set view:[70,40,0.8,1.2]
  set mapping:"cylindrical"
  set :parametric
  set samples:32
  set isosamples:13
  set urange:-180..180
  set vrange:-90..90
  splot "cos(u)",
    "sin(u)",
    ["v", with:"lines", lc_rgb:"cyan"],
    ["'world.dat'", with:"lines", lc_rgb:"blue", lw:2],
    ["'world.cor'", with:"points", lt:1, pt:2]
end
```
![303world/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/303world/image/004.png)
