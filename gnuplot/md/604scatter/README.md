## non-gridded data
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/scatter.html)

### 1

```ruby
# # Simple demo of scatter data conversion to grid data.
# #
# 
# set title "Simple demo of scatter data conversion to grid data"
# unset hidden3d
# set ticslevel 0.5
# set view 60,30
# set autoscale
# set parametric
# set style data points
# set xlabel "data style point - no dgrid"
# set key box
# splot "hemisphr.dat"

Numo.gnuplot do
  set title:"Simple demo of scatter data conversion to grid data"
  unset :hidden3d
  set ticslevel:0.5
  set view:[60,30]
  set :autoscale
  set :parametric
  set :style, :data, :points
  set xlabel:"data style point - no dgrid"
  set :key, :box
  splot "\"hemisphr.dat\""
end
```
![604scatter/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/001.png)

### 2

```ruby
# set dgrid3d 10,10,1
# set xlabel " data style lines, dgrid3d 10,10,1"
# set style data lines
# splot "hemisphr.dat"

Numo.gnuplot do
  set dgrid3d:[10,10,1]
  set xlabel:" data style lines, dgrid3d 10,10,1"
  set :style, :data, :lines
  splot "\"hemisphr.dat\""
end
```
![604scatter/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/002.png)

### 3

```ruby
# set dgrid3d ,,4
# set xlabel " data style lines, dgrid3d ,,4 "
# set style data lines
# splot "hemisphr.dat"

Numo.gnuplot do
  set dgrid3d:",,4"
  set xlabel:" data style lines, dgrid3d ,,4 "
  set :style, :data, :lines
  splot "\"hemisphr.dat\""
end
```
![604scatter/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/003.png)

### 4

```ruby
# set dgrid3d ,,16
# set xlabel " data style lines, dgrid3d ,,16"
# set style data lines
# splot "hemisphr.dat"

Numo.gnuplot do
  set dgrid3d:",,16"
  set xlabel:" data style lines, dgrid3d ,,16"
  set :style, :data, :lines
  splot "\"hemisphr.dat\""
end
```
![604scatter/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/004.png)

### 5

```ruby
# set contour
# set xlabel "data style lines, dgrid3d ,,16, contour"
# splot "hemisphr.dat"

Numo.gnuplot do
  set :contour
  set xlabel:"data style lines, dgrid3d ,,16, contour"
  splot "\"hemisphr.dat\""
end
```
![604scatter/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/005.png)

### 6

```ruby
# unset dgrid3d
# set style data points
# set xlabel "data style points, nodgrid3d"
# splot "scatter2.dat"

Numo.gnuplot do
  unset :dgrid3d
  set :style, :data, :points
  set xlabel:"data style points, nodgrid3d"
  splot "\"scatter2.dat\""
end
```
![604scatter/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/006.png)

### 7

```ruby
# set key nobox
# set dgrid3d ,,1
# set xlabel "data style lines, dgrid3d ,,1"
# set style data lines
# splot "scatter2.dat"

Numo.gnuplot do
  set :key, :nobox
  set dgrid3d:",,1"
  set xlabel:"data style lines, dgrid3d ,,1"
  set :style, :data, :lines
  splot "\"scatter2.dat\""
end
```
![604scatter/007](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/007.png)

### 8

```ruby
# set dgrid3d ,,4
# set xlabel "data style lines, dgrid3d ,,4"
# set style data lines
# splot "scatter2.dat"

Numo.gnuplot do
  set dgrid3d:",,4"
  set xlabel:"data style lines, dgrid3d ,,4"
  set :style, :data, :lines
  splot "\"scatter2.dat\""
end
```
![604scatter/008](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/604scatter/image/008.png)
