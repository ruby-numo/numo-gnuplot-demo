## hidden surfaces
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/hidden.html)

### 1

```ruby
# set samples 20
# set isosamples 20
# set hidden3d
# set title "Hidden line removal of explicit surfaces"
# 
# set xrange [-3:3]
# set yrange [-2:2]
# splot 1 / (x*x + y*y + 1)

Numo.gnuplot do
  set samples:20
  set isosamples:20
  set :hidden3d
  set title:"Hidden line removal of explicit surfaces"
  set xrange:-3..3
  set yrange:-2..2
  splot "1 / (x*x + y*y + 1)"
end
```
![205hidden/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/001.png)

### 2

```ruby
# set xrange [-1:1]
# set yrange [-1:1]
# splot x*y / (x**2 + y**2 + 0.1)

Numo.gnuplot do
  set xrange:-1..1
  set yrange:-1..1
  splot "x*y / (x**2 + y**2 + 0.1)"
end
```
![205hidden/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/002.png)

### 3

```ruby
# set view 70,45
# unset contour
# set xrange [-3:3]
# set yrange [-3:3]
# splot sin(x*x + y*y) / (x*x + y*y)

Numo.gnuplot do
  set view:[70,45]
  unset :contour
  set xrange:-3..3
  set yrange:-3..3
  splot "sin(x*x + y*y) / (x*x + y*y)"
end
```
![205hidden/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/003.png)

### 4

```ruby
# set view 60,30
# set xrange [-3:3]
# set yrange [-3:3]
# set zrange [-1:1]
# set ztics -1,0.5,1
# set grid z
# set border 4095
# splot sin(x) * cos(y)

Numo.gnuplot do
  set view:[60,30]
  set xrange:-3..3
  set yrange:-3..3
  set zrange:-1..1
  set ztics:[-1,0.5,1]
  set grid:"z"
  set border:4095
  splot "sin(x) * cos(y)"
end
```
![205hidden/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/004.png)

### 5

```ruby
# unset grid
# set ztics autofreq
# set border 31
# set view 75,230
# set contour
# replot

Numo.gnuplot do
  unset :grid
  set ztics:"autofreq"
  set border:31
  set view:[75,230]
  set :contour
  replot
end
```
![205hidden/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/005.png)

### 6

```ruby
# set view 80,30,1,1
# set style data lines
# # autoranging loses the verticals
# set xrange [0:15]
# set yrange [0:15]
# splot "glass.dat" using 1

Numo.gnuplot do
  set view:[80,30,1,1]
  set :style, :data, :lines
  set xrange:0..15
  set yrange:0..15
  splot "\"glass.dat\"", using:1
end
```
![205hidden/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/006.png)

### 7

```ruby
# set view 50
# set grid
# replot

Numo.gnuplot do
  set view:50
  set :grid
  replot
end
```
![205hidden/007](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/205hidden/image/007.png)
