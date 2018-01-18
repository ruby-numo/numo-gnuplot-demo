## filled curves
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/fillcrvs.html)

### 1

```ruby
# ### Demo for 'with filledcurves'
#
# reset
#
# set title
# set key outside
# set title "plot with filledcurve [options]"
# plot [-10:10] [-5:3] \
# 	1.5+sin(x)/x with filledcurve x2, \
# 	sin(x)/x with filledcurve, \
# 	1+sin(x)/x with lines, \
# 	-1+sin(x)/x with filledcurve y1=-2, \
# 	-2.5+sin(x)/x with filledcurve xy=-5,-4., \
# 	-4.3+sin(x)/x with filledcurve x1, \
# 	(x>3.5 ? x/3-3 : 1/0) with filledcurve y2

Numo.gnuplot do
  reset
  set :title
  set :key, :outside
  set title:"plot with filledcurve [options]"
  plot  -10..10, -5..3,
    ["1.5+sin(x)/x", with:'filledcurve x2'],
    ["sin(x)/x", with:"filledcurve"],
    ["1+sin(x)/x", with:"lines"],
    ["-1+sin(x)/x", with:'filledcurve y1=-2'],
    ["-2.5+sin(x)/x", with:'filledcurve xy=-5,-4.'],
    ["-4.3+sin(x)/x", with:'filledcurve x1'],
    ["(x>3.5 ? x/3-3 : 1/0)", with:'filledcurve y2']
end
```
![002fillcrvs/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/001.png)

### 2

```ruby
# set key on
# set title "Intersection of two parabolas"
# plot x*x with filledcurves, 50-x*x with filledcurves, x*x with line lt 1

Numo.gnuplot do
  set :key, :on
  set title:"Intersection of two parabolas"
  plot ["x*x", with:"filledcurves"],
    ["50-x*x", with:"filledcurves"],
    ["x*x", with:"line", lt:1]
end
```
![002fillcrvs/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/002.png)

### 3

```ruby
# set grid front
# set title "Filled sinus and cosinus curves"
# plot 2+sin(x)**2 with filledcurve x1, cos(x)**2 with filledcurve x1

Numo.gnuplot do
  set :grid, :front
  set title:"Filled sinus and cosinus curves"
  plot ["2+sin(x)**2", with:'filledcurve x1'],
    ["cos(x)**2", with:'filledcurve x1']
end
```
![002fillcrvs/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/003.png)

### 4

```ruby
# set title "The red bat: abs(x) with filledcurve xy=2,5"
# plot abs(x) with filledcurve xy=2,5

Numo.gnuplot do
  set title:"The red bat: abs(x) with filledcurve xy=2,5"
  plot "abs(x)", with:'filledcurve xy=2,5'
end
```
![002fillcrvs/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/004.png)

### 5

```ruby
# set title "Some sqrt stripes on filled graph background"
# plot [0:10] [-8:6] \
# 	-8 with filledcurve x2 lt 15, \
# 	sqrt(x) with filledcurves y1=-0.5, \
# 	sqrt(10-x)-4.5 with filledcurves y1=-5.5

Numo.gnuplot do
  set title:"Some sqrt stripes on filled graph background"
  plot  0..10, -8..6,
    ["-8", with:'filledcurve x2', lt:15],
    ["sqrt(x)", with:'filledcurves y1=-0.5'],
    ["sqrt(10-x)-4.5", with:'filledcurves y1=-5.5']
end
```
![002fillcrvs/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/005.png)

### 6

```ruby
# reset
# set title "Let's smile with parametric filled curves"
# set size square
# set key off
# unset border
# unset xtics
# unset ytics
# set grid
# set arrow 1 from -0.1,0.26 to 0.18,-0.17 front size 0.1,40 lt 5 lw 4
# set label 1 "gnuplot" at 0,1.2 center front
# set label 2 "gnuplot" at 0.02,-0.6 center front
# set parametric
# set xrange [-1:1]
# set yrange [-1:1.6]
# plot [t=-pi:pi] \
# 	sin(t),cos(t) with filledcurve xy=0,0 lt 15,	\
# 	sin(t)/8-0.5,cos(t)/8+0.4 with filledcurve lt 3,	\
# 	sin(t)/8+0.5,cos(t)/8+0.4 with filledcurve lt 3,	\
# 	t/5,abs(t/5)-0.8 with filledcurve xy=0.1,-0.5 lt 1, \
# 	t/3,1.52-abs(t/pi) with filledcurve xy=0,1.8 lt -1

Numo.gnuplot do
  reset
  set title:"Let's smile with parametric filled curves"
  set size:"square"
  set :key, :off
  unset :border
  unset :xtics
  unset :ytics
  set :grid
  set :arrow, 1, from:[-0.1,0.26], to:[0.18,-0.17], front:true, size:[0.1,40], lt:5, lw:4
  set :label, 1, "gnuplot", at:[0,1.2], center:true, front:true
  set :label, 2, "gnuplot", at:[0.02,-0.6], center:true, front:true
  set :parametric
  set xrange:-1..1
  set yrange:-1..1.6
  plot "[t=-pi:pi]",
    "sin(t)",
    ["cos(t)", with:'filledcurve xy=0,0', lt:15],
    "sin(t)/8-0.5",
    ["cos(t)/8+0.4", with:"filledcurve", lt:3],
    "sin(t)/8+0.5",
    ["cos(t)/8+0.4", with:"filledcurve", lt:3],
    "t/5",
    ["abs(t/5)-0.8", with:'filledcurve xy=0.1,-0.5', lt:1],
    "t/3",
    ["1.52-abs(t/pi)", with:'filledcurve xy=0,1.8', lt:-1]
end
```
![002fillcrvs/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/006.png)

### 7

```ruby
# reset
#
# set title "world.dat plotted with filledcurves"
# set format x ""
# set format y ""
# set grid layerdefault linewidth 0.5
# set object  1 rect from graph 0, 0 to graph 1, 1 behind fc  rgb "#afffff" fillstyle solid 1.00 border -1
# set xrange [ -180.000 : 180.000 ]
# set yrange [ -70.0000 : 80.0000 ]
# set lmargin  1
# plot 'world.dat' with filledcurve notitle fs solid 1.0 lc rgb 'dark-goldenrod'

Numo.gnuplot do
  reset
  set title:"world.dat plotted with filledcurves"
  set format_x:""
  set format_y:""
  set :grid, "layerdefault", linewidth:0.5
  set :object, 1, "rect", from_graph:[0,0], to_graph:[1,1], behind:true, fc_rgb:"#afffff", fillstyle_solid:1.00, border:-1
  set xrange:-180.000..180.000
  set yrange:-70.0000..80.0000
  set lmargin:1
  plot "'world.dat'", with:"filledcurve", notitle:true, fs_solid:1.0, lc_rgb:'dark-goldenrod'
end
```
![002fillcrvs/007](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/002fillcrvs/image/007.png)
