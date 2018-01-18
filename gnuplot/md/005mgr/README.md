## error bars
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/mgr.html)

### 1

```ruby
# print "Watch some  cubic splines"
# set samples 50
# set xlabel "Angle (deg)"
# set ylabel "Amplitude"
# set key box
# set title "Bragg reflection -- Peak only"
# plot "big_peak.dat" title "Rate" with errorbars, \
#                  "" smooth csplines t "Rate"

Numo.gnuplot do
  set samples:50
  set xlabel:"Angle (deg)"
  set ylabel:"Amplitude"
  set :key, :box
  set title:"Bragg reflection -- Peak only"
  plot ["\"big_peak.dat\"", title:"Rate", with:"errorbars"],
    ["\"\"", smooth:"csplines", t:"Rate"]
end
```
![005mgr/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/001.png)

### 2

```ruby
# set bars small
# replot

Numo.gnuplot do
  set bars:"small"
  replot
end
```
![005mgr/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/002.png)

### 3

```ruby
# set bars large
# #
# set samples 300
# set xlabel "Time (sec)"
# set ylabel "Rate"
# set title "Ag 108 decay data"
# plot "silver.dat" t "experimental" w errorb, \
#                ""  smooth csplines t "cubic smooth"

Numo.gnuplot do
  set bars:"large"
  set samples:300
  set xlabel:"Time (sec)"
  set ylabel:"Rate"
  set title:"Ag 108 decay data"
  plot ["\"silver.dat\"", t:"experimental", w:"errorb"],
    ["\"\"", smooth:"csplines", t:"cubic smooth"]
end
```
![005mgr/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/003.png)

### 4

```ruby
# # error is column 3; weight larger errors less
# # start with rel error = 1/($3/$2)
# S=1
# plot "silver.dat" t "experimental" w errorb,\
#                "" u 1:2:(S*$2/$3) smooth acsplines t "acspline Y/Z"

Numo.gnuplot do
  run "S=1"
  plot ["\"silver.dat\"", t:"experimental", w:"errorb"],
    ["\"\"", u:'1:2:(S*$2/$3)', smooth:"acsplines", t:"acspline Y/Z"]
end
```
![005mgr/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/004.png)

### 5

```ruby
# plot "silver.dat" t "rate" w errorb,\
#                "" u 1:2:($2/($3*1.e1)) sm acs t "acspline Y/(Z*1.e1)",\
#                "" u 1:2:($2/($3*1.e3)) sm acs t "         Y/(Z*1.e3)",\
#                "" u 1:2:($2/($3*1.e5)) sm acs t "         Y/(Z*1.e5)"

Numo.gnuplot do
  plot ["\"silver.dat\"", t:"rate", w:"errorb"],
    ["\"\"", u:'1:2:($2/($3*1.e1))', sm:"acs", t:"acspline Y/(Z*1.e1)"],
    ["\"\"", u:'1:2:($2/($3*1.e3))', sm:"acs", t:"         Y/(Z*1.e3)"],
    ["\"\"", u:'1:2:($2/($3*1.e5))', sm:"acs", t:"         Y/(Z*1.e5)"]
end
```
![005mgr/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/005.png)

### 6

```ruby
# set logscale y
# set grid x y mx my
# replot

Numo.gnuplot do
  set logscale:"y"
  set :grid, "x y mx my"
  replot
end
```
![005mgr/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/006.png)

### 7

```ruby
# unset logscale y
# plot "silver.dat" t "experimental" w errorb,\
#                "" smooth sbezier t "bezier"

Numo.gnuplot do
  unset logscale:"y"
  plot ["\"silver.dat\"", t:"experimental", w:"errorb"],
    ["\"\"", smooth:"sbezier", t:"bezier"]
end
```
![005mgr/007](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/007.png)

### 8

```ruby
# set logscale y
# plot "silver.dat" t "rate" w errorb, \
#                "" smooth sbezier t "bezier"

Numo.gnuplot do
  set logscale:"y"
  plot ["\"silver.dat\"", t:"rate", w:"errorb"],
    ["\"\"", smooth:"sbezier", t:"bezier"]
end
```
![005mgr/008](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/008.png)

### 9

```ruby
# set samples 100
# unset logscale
# unset grid
# set xlabel "Resistance [Ohm]"
# set ylabel "Power [W]"
# set title "UM1-Cell Power"
# n(x)=1.53**2*x/(5.67+x)**2
# plot [0:50] "battery.dat" t "Power" with xyerrorbars, n(x) t "Theory" w lines

Numo.gnuplot do
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
```
![005mgr/009](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/009.png)

### 10

```ruby
# plot [0:50] "battery.dat" t "Power" with boxxy, n(x) t "Theory" w lines

Numo.gnuplot do
  plot  0..50,
    ["\"battery.dat\"", t:"Power", with:"boxxy"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/010](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/010.png)

### 11

```ruby
# plot [0:50] "battery.dat" u 1:2:3 t "Power" w xerr, n(x) t "Theory" w lines

Numo.gnuplot do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,3], t:"Power", w:"xerr"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/011](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/011.png)

### 12

```ruby
# plot [0:50] "battery.dat" u 1:2:4 t "Power" w yerr, n(x) t "Theory" w lines

Numo.gnuplot do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,4], t:"Power", w:"yerr"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/012](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/012.png)

### 13

```ruby
# set logscale y
# plot [0:50] "battery.dat" u 1:2:4 t "Power" w yerr, n(x) t "Theory" w lines

Numo.gnuplot do
  set logscale:"y"
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,4], t:"Power", w:"yerr"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/013](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/013.png)

### 14

```ruby
# set logscale xy
# plot [1:50] "battery.dat" t "Power" w xyerr, n(x) t "Theory" w lines

Numo.gnuplot do
  set logscale:"xy"
  plot  1..50,
    ["\"battery.dat\"", t:"Power", w:"xyerr"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/014](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/014.png)

### 15

```ruby
# unset logscale
# set bars small
# plot [0:50] "battery.dat" t "Power" with xyerrorbars, n(x) t "Theory" w lines

Numo.gnuplot do
  unset :logscale
  set bars:"small"
  plot  0..50,
    ["\"battery.dat\"", t:"Power", with:"xyerrorbars"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/015](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/015.png)

### 16

```ruby
# plot [0:50] "battery.dat" u 1:2:3 t "Power" w xerr, n(x) t "Theory" w lines

Numo.gnuplot do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,3], t:"Power", w:"xerr"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/016](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/016.png)

### 17

```ruby
# plot [0:50] "battery.dat" u 1:2:4 t "Power" w yerr, n(x) t "Theory" w lines

Numo.gnuplot do
  plot  0..50,
    ["\"battery.dat\"", u:[1,2,4], t:"Power", w:"yerr"],
    ["n(x)", t:"Theory", w:"lines"]
end
```
![005mgr/017](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/005mgr/image/017.png)
