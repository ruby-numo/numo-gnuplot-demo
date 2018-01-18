## step functions
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/steps.html)

### 1

```ruby
# # This file will serve as the datafile used in demonstrating the
# # "plot with steps" option.   Here is a gnuplot input file
# # which uses "plot with steps", inverse error function, normal
# # distribution function, and the inverse normal distribution
# # function.
#
# set title "Compare steps, fsteps and histeps"
# plot [0:12][0:13] "steps.dat" notitle with points,  \
#  "steps.dat" title 'steps' with steps, \
#  'steps.dat' title 'fsteps' with fsteps, \
#  'steps.dat' title 'histeps' with histeps

Numo.gnuplot do
  set title:"Compare steps, fsteps and histeps"
  plot  0..12, 0..13,
    ["\"steps.dat\"", :notitle, with:"points"],
    ["\"steps.dat\"", title:'steps', with:"steps"],
    ["'steps.dat'", title:'fsteps', with:"fsteps"],
    ["'steps.dat'", title:'histeps', with:"histeps"]
end
```
![007steps/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/007steps/image/001.png)

### 2

```ruby
# set title "Histogram built from unsorted data by 'smooth frequency'"
# set ylabel 'counts per bin'
# set xlabel 'bins'
# plot 'hemisphr.dat' u (floor($1*20)):(1) smooth frequency with histeps

Numo.gnuplot do
  set title:"Histogram built from unsorted data by 'smooth frequency'"
  set ylabel:'counts per bin'
  set xlabel:'bins'
  plot "'hemisphr.dat'", u:'(floor($1*20)):(1)', smooth:"frequency", with:"histeps"
end
```
![007steps/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/007steps/image/002.png)

### 3

```ruby
# unset xlabel
# unset ylabel
#
# set title "Normal Distribution Function"
# plot [-3:3][0:1] norm(x)

Numo.gnuplot do
  unset :xlabel
  unset :ylabel
  set title:"Normal Distribution Function"
  plot  -3..3, 0..1,
    "norm(x)"
end
```
![007steps/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/007steps/image/003.png)

### 4

```ruby
# set title "Inverse Error Function"
# plot [-1:1] inverf(x)

Numo.gnuplot do
  set title:"Inverse Error Function"
  plot  -1..1,
    "inverf(x)"
end
```
![007steps/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/007steps/image/004.png)

### 5

```ruby
# set title "Inverse Normal Distribution Function"
# plot [0:1] invnorm(x)

Numo.gnuplot do
  set title:"Inverse Normal Distribution Function"
  plot  0..1,
    "invnorm(x)"
end
```
![007steps/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/007steps/image/005.png)
