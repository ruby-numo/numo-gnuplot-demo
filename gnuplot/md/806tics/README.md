## axis ticmarks
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/tics.html)

### 1

```ruby
# # demo for tics settings
#
# set xlabel "x"
# set ylabel "y"
# set mxtics
#
# set title "Default tics settings"
# set xrange [-15:15]
# set yrange [-0.25:1]
# plot sin(sqrt(x**2))/sqrt(x**2) notitle

Numo.gnuplot do
  set xlabel:"x"
  set ylabel:"y"
  set :mxtics
  set title:"Default tics settings"
  set xrange:-15..15
  set yrange:-0.25..1
  plot "sin(sqrt(x**2))/sqrt(x**2)", :notitle
end
```
![806tics/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/806tics/image/001.png)

### 2

```ruby
# set title "Different modification of tics settings"
# set tics scale 3,2 rotate by 45
# set xtics out offset 0,-1.0
# replot

Numo.gnuplot do
  set title:"Different modification of tics settings"
  set :tics, :scale, [3,2], rotate_by:45
  set :xtics, :out, offset:[0,-1.0]
  replot
end
```
![806tics/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/806tics/image/002.png)

### 3

```ruby
# set xtics textcolor rgb "red" norotate
# set ytics rotate by 90 offset 2,0
# replot

Numo.gnuplot do
  set :xtics, :textcolor, rgb:"red", norotate:true
  set :ytics, :rotate, by:90, offset:[2,0]
  replot
end
```
![806tics/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/806tics/image/003.png)

### 4

```ruby
# set title "Modification of tics settings (pm3d map with colorbar)"
# set pm3d map
# set border 4095
# set samples 25
# set isosamples 20
# set palette color positive
# set samples 50; set isosamples 50
# set tics norotate nooffset
# set cbtics in scale 4
# set xrange [-15:15]
# set yrange [-15:15]
# set zrange [-0.25:1]
# splot sin(sqrt(x**2+y**2))/sqrt(x**2+y**2) notitle

Numo.gnuplot do
  set title:"Modification of tics settings (pm3d map with colorbar)"
  set :pm3d, :map
  set border:4095
  set samples:25
  set isosamples:20
  set :palette, color:"positive"
  set samples:50; set isosamples:50
  set :tics, :norotate, :nooffset
  set :cbtics, :in, scale:4
  set xrange:-15..15
  set yrange:-15..15
  set zrange:-0.25..1
  splot "sin(sqrt(x**2+y**2))/sqrt(x**2+y**2)", :notitle
end
```
![806tics/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/806tics/image/004.png)
