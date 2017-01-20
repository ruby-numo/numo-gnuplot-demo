## candlesticks
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/candlesticks.html)

### 1

```ruby
# reset
# #
# set xrange [0:11]
# set yrange [0:10]
# #
# set title "candlesticks with open boxes (default)"
# plot 'candlesticks.dat' using 1:3:2:6:5 with candlesticks

Numo.gnuplot do
  reset
  set xrange:0..11
  set yrange:0..10
  set title:"candlesticks with open boxes (default)"
  plot "'candlesticks.dat'", using:[1,3,2,6,5], with:"candlesticks"
end
```
![004candlesticks/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/004candlesticks/image/001.png)

### 2

```ruby
# set title "candlesticks with specified boxwidth"
# set boxwidth 0.2
# replot

Numo.gnuplot do
  set title:"candlesticks with specified boxwidth"
  set boxwidth:0.2
  replot
end
```
![004candlesticks/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/004candlesticks/image/002.png)

### 3

```ruby
# set title "candlesticks with style fill solid"
# set style fill solid
# set boxwidth 0.2
# replot

Numo.gnuplot do
  set title:"candlesticks with style fill solid"
  set :style, :fill_solid
  set boxwidth:0.2
  replot
end
```
![004candlesticks/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/004candlesticks/image/003.png)

### 4

```ruby
# set title "candlesticks showing both states of open/close"
# set style fill empty
# set boxwidth 0.2
# plot 'candlesticks.dat' using 1:(int($0)%3?$3:$5):2:6:(int($0)%3?$5:$3) with candlesticks title "open < close", \
# NaN with boxes lt 1 fs solid 1 title "close < open"

Numo.gnuplot do
  set title:"candlesticks showing both states of open/close"
  set :style, :fill, :empty
  set boxwidth:0.2
  plot ["'candlesticks.dat'", using:'1:(int($0)%3?$3:$5):2:6:(int($0)%3?$5:$3)', with:"candlesticks", title:"open < close"],
    ["NaN", with:"boxes", lt:1, fs_solid:1, title:"close < open"]
end
```
![004candlesticks/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/004candlesticks/image/004.png)

### 5

```ruby
# set title "box-and-whisker plot adding median value as bar"
# set style fill empty
# plot 'candlesticks.dat' using 1:3:2:6:5 with candlesticks lt 3 lw 2 title 'Quartiles', \
#      ''                 using 1:4:4:4:4 with candlesticks lt -1 lw 2 notitle

Numo.gnuplot do
  set title:"box-and-whisker plot adding median value as bar"
  set :style, :fill, :empty
  plot ["'candlesticks.dat'", using:[1,3,2,6,5], with:"candlesticks", lt:3, lw:2, title:'Quartiles'],
    ["''", using:[1,4,4,4,4], with:"candlesticks", lt:-1, lw:2, notitle:true]
end
```
![004candlesticks/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/004candlesticks/image/005.png)

### 6

```ruby
# set title "box-and-whisker with median bar and whiskerbars"
# plot 'candlesticks.dat' using 1:3:2:6:5 with candlesticks lt 3 lw 2 title 'Quartiles' whiskerbars, \
#      ''                 using 1:4:4:4:4 with candlesticks lt -1 lw 2 notitle

Numo.gnuplot do
  set title:"box-and-whisker with median bar and whiskerbars"
  plot ["'candlesticks.dat'", using:[1,3,2,6,5], with:"candlesticks", lt:3, lw:2, title:'Quartiles', whiskerbars:true],
    ["''", using:[1,4,4,4,4], with:"candlesticks", lt:-1, lw:2, notitle:true]
end
```
![004candlesticks/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/004candlesticks/image/006.png)
