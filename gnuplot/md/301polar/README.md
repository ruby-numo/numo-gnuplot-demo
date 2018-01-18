## polar coords
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/polar.html)

### 1

```ruby
# # Show some of the new polar capabilities.
# #
# unset border
# set clip
# set polar
# set xtics axis nomirror
# set ytics axis nomirror
# unset rtics
# set samples 160
# set zeroaxis
# set trange [0:2*pi]
# set title "Three circles (with aspect ratio distortion)"
# plot .5,1,1.5

Numo.gnuplot do
  unset :border
  set :clip
  set :polar
  set :xtics, :axis, :nomirror
  set :ytics, :axis, :nomirror
  unset :rtics
  set samples:160
  set :zeroaxis
  set trange:"[0:2*pi]"
  set title:"Three circles (with aspect ratio distortion)"
  plot ".5",
    "1",
    "1.5"
end
```
![301polar/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/001.png)

### 2

```ruby
# set title ""
# set key box
#
# plot cos(2*t)

Numo.gnuplot do
  set title:""
  set :key, :box
  plot "cos(2*t)"
end
```
![301polar/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/002.png)

### 3

```ruby
# plot 2*sqrt(cos(t)),-2*sqrt(cos(t))

Numo.gnuplot do
  plot "2*sqrt(cos(t))",
    "-2*sqrt(cos(t))"
end
```
![301polar/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/003.png)

### 4

```ruby
# plot sin(4*t),cos(4*t)

Numo.gnuplot do
  plot "sin(4*t)",
    "cos(4*t)"
end
```
![301polar/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/004.png)

### 5

```ruby
# set offset 0,0,0,0
#
# set xrange [-5:5]
# set yrange [-5:5]
# plot t/cos(3*t)

Numo.gnuplot do
  set offset:[0,0,0,0]
  set xrange:-5..5
  set yrange:-5..5
  plot "t/cos(3*t)"
end
```
![301polar/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/005.png)

### 6

```ruby
# set autoscale
#
# plot 1-sin(t)

Numo.gnuplot do
  set :autoscale
  plot "1-sin(t)"
end
```
![301polar/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/006.png)

### 7

```ruby
# set trange [0:12*pi]
# plot 2*t

Numo.gnuplot do
  set trange:"[0:12*pi]"
  plot "2*t"
end
```
![301polar/007](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/007.png)

### 8

```ruby
# butterfly(x)=exp(cos(x))-2*cos(4*x)+sin(x/12)**5
# set samples 800
# set title "Butterfly"
# unset key
# plot butterfly(t)

Numo.gnuplot do
  run "butterfly(x)=exp(cos(x))-2*cos(4*x)+sin(x/12)**5"
  set samples:800
  set title:"Butterfly"
  unset :key
  plot "butterfly(t)"
end
```
![301polar/008](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/008.png)

### 9

```ruby
# reset
#
# set polar
# set grid polar
# unset xtics
# unset ytics
# set border 0
# set style fill solid 0.5
# set rrange [0.1 : 4]
# set size square
# set key title "bounding radius 2.5"
# set key outside top right samplen 0.7
#
# plot 3.+sin(t)*cos(5*t) with filledcurve above r=2.5 notitle,\
#      3.+sin(t)*cos(5*t) with line

Numo.gnuplot do
  reset
  set :polar
  set :grid, :polar
  unset :xtics
  unset :ytics
  set border:0
  set :style, fill_solid:0.5
  set rrange:0.1..4
  set size:"square"
  set :key, title:"bounding radius 2.5"
  set :key, :outside, :top, :right, samplen:0.7
  plot ["3.+sin(t)*cos(5*t)", with:'filledcurve above r=2.5', notitle:true],
    ["3.+sin(t)*cos(5*t)", with:"line"]
end
```
![301polar/009](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/301polar/image/009.png)
