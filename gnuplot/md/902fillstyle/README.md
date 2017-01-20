## fill styles
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/fillstyle.html)

### 1

```ruby
# # E A Merritt <merritt@u.washington.edu>          24-Sep-2002
# #
# # Demo for revised fillstyle code selected by 
# # ./configure --enable-filledboxes --enable-relative-boxwidth
# #
# reset
# 
# set samples 25
# unset xtics
# unset ytics
# set yrange [0:120]
# 
# set title "A demonstration of boxes with default properties"
# plot [-10:10] 100/(1.0+x*x) title 'distribution' with boxes

Numo.gnuplot do
  reset
  set samples:25
  unset :xtics
  unset :ytics
  set yrange:0..120
  set title:"A demonstration of boxes with default properties"
  plot  -10..10,
    "100/(1.0+x*x)", title:'distribution', with:"boxes"
end
```
![902fillstyle/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/001.png)

### 2

```ruby
# set title "A demonstration of boxes with style fill solid 1.0"
# set style fill solid 1.0
# replot

Numo.gnuplot do
  set title:"A demonstration of boxes with style fill solid 1.0"
  set :style, fill_solid:1.0
  replot
end
```
![902fillstyle/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/002.png)

### 3

```ruby
# set title "A demonstration of boxes with style fill solid border -1"
# set style fill solid border -1
# replot

Numo.gnuplot do
  set title:"A demonstration of boxes with style fill solid border -1"
  set :style, :fill_solid, border:-1
  replot
end
```
![902fillstyle/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/003.png)

### 4

```ruby
# set title "Filled boxes of reduced width"
# set boxwidth 0.5 
# replot

Numo.gnuplot do
  set title:"Filled boxes of reduced width"
  set boxwidth:0.5
  replot
end
```
![902fillstyle/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/004.png)

### 5

```ruby
# set title "Filled boxes at 50% fill density"
# set style fill solid 0.25 border
# replot

Numo.gnuplot do
  set title:"Filled boxes at 50% fill density"
  set :style, fill_solid:0.25, border:true
  replot
end
```
![902fillstyle/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/005.png)

### 6

```ruby
# set title "A demonstration of boxes with style fill solid 0.25 noborder"
# set style fill solid 0.25 noborder
# replot

Numo.gnuplot do
  set title:"A demonstration of boxes with style fill solid 0.25 noborder"
  set :style, fill_solid:0.25, noborder:true
  replot
end
```
![902fillstyle/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/006.png)

### 7

```ruby
# set title "A demonstration of boxes in mono with style fill pattern"
# set samples 11
# set boxwidth 0.5 
# set style fill pattern border
# plot [-2.5:4.5] 100/(1.0+x*x) title 'pattern 0' with boxes lt -1, \
#                  80/(1.0+x*x) title 'pattern 1' with boxes lt -1, \
#                  40/(1.0+x*x) title 'pattern 2' with boxes lt -1, \
#                  20/(1.0+x*x) title 'pattern 3' with boxes lt -1

Numo.gnuplot do
  set title:"A demonstration of boxes in mono with style fill pattern"
  set samples:11
  set boxwidth:0.5
  set :style, :fill, :pattern, :border
  plot  -2.5..4.5,
    ["100/(1.0+x*x)", title:'pattern 0', with:"boxes", lt:-1],
    ["80/(1.0+x*x)", title:'pattern 1', with:"boxes", lt:-1],
    ["40/(1.0+x*x)", title:'pattern 2', with:"boxes", lt:-1],
    ["20/(1.0+x*x)", title:'pattern 3', with:"boxes", lt:-1]
end
```
![902fillstyle/007](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/902fillstyle/image/007.png)
