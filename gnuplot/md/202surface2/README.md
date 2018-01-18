## surfaces 2
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/surface2.html)

### 1

```ruby
# set parametric
# set isosamples 50,10
# set hidden
# set key below
#
# set title "Parametric Sphere"
# set urange [-pi/2:pi/2]
# set vrange [0:2*pi]
# set ztics nomirror -1.0,0.25,1.0
# set view 45,50
# splot cos(u)*cos(v),cos(u)*sin(v),sin(u)

Numo.gnuplot do
  set :parametric
  set isosamples:[50,10]
  set :hidden
  set :key, "below"
  set title:"Parametric Sphere"
  set urange:"[-pi/2:pi/2]"
  set vrange:"[0:2*pi]"
  set :ztics, :nomirror, [-1.0,0.25,1.0]
  set view:[45,50]
  splot "cos(u)*cos(v)",
    "cos(u)*sin(v)",
    "sin(u)"
end
```
![202surface2/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/001.png)

### 2

```ruby
# set view ,,,0.7
# set title "Parametric Sphere, crunched z axis"
# replot

Numo.gnuplot do
  set view:',,,0.7'
  set title:"Parametric Sphere, crunched z axis"
  replot
end
```
![202surface2/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/002.png)

### 3

```ruby
# set view ,,,1.4
# set title "Parametric Sphere, enlarged z axis"
# replot

Numo.gnuplot do
  set view:',,,1.4'
  set title:"Parametric Sphere, enlarged z axis"
  replot
end
```
![202surface2/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/003.png)

### 4

```ruby
# set view ,,,1.0
#
# set title "Parametric Torus"
# set urange [0:2*pi]
# set vrange [0:2*pi]
# set zrange [-1:1]        # imitate old 'set view' hack
# splot (1-0.2*cos(v))*cos(u),(1-0.2*cos(v))*sin(u),0.2*sin(v)

Numo.gnuplot do
  set view:',,,1.0'
  set title:"Parametric Torus"
  set urange:"[0:2*pi]"
  set vrange:"[0:2*pi]"
  set zrange:-1..1        # imitate old 'set view' hack
  splot "(1-0.2*cos(v))*cos(u)",
    "(1-0.2*cos(v))*sin(u)",
    "0.2*sin(v)"
end
```
![202surface2/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/004.png)

### 5

```ruby
# set title "Parametric Hexagon"
# set urange [-1.3:1.3]
# set vrange [0:2*pi]
# set autoscale z
# set ticslevel 0.	# reserve more space z direction.
# set view ,,0.7,1.4	# crunch xyz, and re-extend z back to full size
# set ztics autofreq
# splot cos(v)**3*cos(u)**3,sin(v)**3*cos(u)**3,sin(u)**3

Numo.gnuplot do
  set title:"Parametric Hexagon"
  set urange:-1.3..1.3
  set vrange:"[0:2*pi]"
  set autoscale:"z"
  set ticslevel:0.0	# reserve more space z direction.
  set view:',,0.7,1.4'	# crunch xyz, and re-extend z back to "full" size
  set ztics:"autofreq"
  splot "cos(v)**3*cos(u)**3",
    "sin(v)**3*cos(u)**3",
    "sin(u)**3"
end
```
![202surface2/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/005.png)

### 6

```ruby
# set view ,,1.,1.
#
# set title "Parametric Helix"
# set isosamples 100,20
# set urange [0:10*pi]
# set vrange [0:2*pi]
# set autoscale z
# splot (1-0.1*cos(v))*cos(u),(1-0.1*cos(v))*sin(u),0.1*(sin(v)+u/1.7-10)

Numo.gnuplot do
  set view:',,1.,1.'
  set title:"Parametric Helix"
  set isosamples:[100,20]
  set urange:"[0:10*pi]"
  set vrange:"[0:2*pi]"
  set autoscale:"z"
  splot "(1-0.1*cos(v))*cos(u)",
    "(1-0.1*cos(v))*sin(u)",
    "0.1*(sin(v)+u/1.7-10)"
end
```
![202surface2/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/006.png)

### 7

```ruby
# set title "Parametric Shell (clipped to limited z range)"
# set isosamples 40,20
# set view 50,30,1.0
# set urange [0:2*pi]
# set vrange [0:2*pi]
# set zrange [-3:1.5]
# splot cos(u)*u*(1+cos(v)/2),sin(v)*u/2,sin(u)*u*(1+cos(v)/2)

Numo.gnuplot do
  set title:"Parametric Shell (clipped to limited z range)"
  set isosamples:[40,20]
  set view:[50,30,1.0]
  set urange:"[0:2*pi]"
  set vrange:"[0:2*pi]"
  set zrange:-3..1.5
  splot "cos(u)*u*(1+cos(v)/2)",
    "sin(v)*u/2",
    "sin(u)*u*(1+cos(v)/2)"
end
```
![202surface2/007](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/007.png)

### 8

```ruby
# set autoscale z
# set title "Parametric Shell (automatic z range)"
# replot

Numo.gnuplot do
  set autoscale:"z"
  set title:"Parametric Shell (automatic z range)"
  replot
end
```
![202surface2/008](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/008.png)

### 9

```ruby
# set title "Interlocking Tori"
#
# set urange [-pi:pi]
# set vrange [-pi:pi]
# set isosamples 50,20
# splot cos(u)+.5*cos(u)*cos(v),sin(u)+.5*sin(u)*cos(v),.5*sin(v) with lines, \
#       1+cos(u)+.5*cos(u)*cos(v),.5*sin(v),sin(u)+.5*sin(u)*cos(v) with lines

Numo.gnuplot do
  set title:"Interlocking Tori"
  set urange:"[-pi:pi]"
  set vrange:"[-pi:pi]"
  set isosamples:[50,20]
  splot "cos(u)+.5*cos(u)*cos(v)",
    "sin(u)+.5*sin(u)*cos(v)",
    [".5*sin(v)", with:"lines"],
    "1+cos(u)+.5*cos(u)*cos(v)",
    ".5*sin(v)",
    ["sin(u)+.5*sin(u)*cos(v)", with:"lines"]
end
```
![202surface2/009](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/202surface2/image/009.png)
