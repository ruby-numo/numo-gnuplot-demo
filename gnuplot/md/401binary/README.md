## binary data
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/binary.html)

### 1

```ruby
# set style data lines
# set hidden3d
# set title "Hidden line removal of explicit binary surfaces"
# set ticslevel 0
# set key box
#
# set xrange [-3:3]
# set yrange [-2:2]
# splot "binary1" binary

Numo.gnuplot do
  set :style, :data, :lines
  set :hidden3d
  set title:"Hidden line removal of explicit binary surfaces"
  set ticslevel:0
  set :key, :box
  set xrange:-3..3
  set yrange:-2..2
  splot "\"binary1\"", :binary
end
```
![401binary/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/401binary/image/001.png)

### 2

```ruby
# set view 70,45
# set xrange [-3:3]
# set yrange [-3:3]
# splot "binary2" binary

Numo.gnuplot do
  set view:[70,45]
  set xrange:-3..3
  set yrange:-3..3
  splot "\"binary2\"", :binary
end
```
![401binary/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/401binary/image/002.png)

### 3

```ruby
# set title "Notice that sampling rate can change"
# set vi 70,10
# set xrange [-3:6]
# set yrange [-3:6]
# splot "binary3" binary

Numo.gnuplot do
  set title:"Notice that sampling rate can change"
  set vi:[70,10]
  set xrange:-3..6
  set yrange:-3..6
  splot "\"binary3\"", :binary
end
```
![401binary/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/401binary/image/003.png)
