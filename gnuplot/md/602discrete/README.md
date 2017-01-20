## discrete contours
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/discrete.html)

### 1

```ruby
# set contour
# set title "Demo of specifying discrete contour levels  -  default contours"
# splot x*y

Numo.gnuplot do
  set :contour
  set title:"Demo of specifying discrete contour levels  -  default contours"
  splot "x*y"
end
```
![602discrete/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/602discrete/image/001.png)

### 2

```ruby
# #set discrete levels
# set cntrparam levels discrete 0, 15, 75
# set title "3 discrete contours at 0 15 & 75"
# replot

Numo.gnuplot do
  set :cntrparam, :levels, discrete:[0,15,75]
  set title:"3 discrete contours at 0 15 & 75"
  replot
end
```
![602discrete/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/602discrete/image/002.png)

### 3

```ruby
# #set incremental levels
# set cntrp level incr -20, 5, 9
# set title "9 incremental contours starting at -20, stepping by 5"
# replot

Numo.gnuplot do
  set :cntrp, :level, incr:[-20,5,9]
  set title:"9 incremental contours starting at -20, stepping by 5"
  replot
end
```
![602discrete/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/602discrete/image/003.png)
