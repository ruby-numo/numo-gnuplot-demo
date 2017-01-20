## parametric functions
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/param.html)

### 1

```ruby
# # Show some of the new parametric capabilities.
# #
# set parametric
# set dummy t
# set autoscale
# set samples 160
# set title ""
# set key box
# set key below
# plot t,sin(t)/t title "t,sin(t)/t or sin(x)/x"

Numo.gnuplot do
  set :parametric
  set dummy:"t"
  set :autoscale
  set samples:160
  set title:""
  set :key, :box
  set :key, "below"
  plot "t",
    ["sin(t)/t", title:"t,sin(t)/t or sin(x)/x"]
end
```
![011param/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/001.png)

### 2

```ruby
# plot sin(t)/t,t

Numo.gnuplot do
  plot "sin(t)/t",
    "t"
end
```
![011param/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/002.png)

### 3

```ruby
# plot sin(t),cos(t)

Numo.gnuplot do
  plot "sin(t)",
    "cos(t)"
end
```
![011param/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/003.png)

### 4

```ruby
# set xrange [-3:3]
# set yrange [-3:3]
# set title "Parametric Conic Sections"
# plot -t,t,cos(t),cos(2*t),2*cos(t),sin(t),-cosh(t),sinh(t)

Numo.gnuplot do
  set xrange:-3..3
  set yrange:-3..3
  set title:"Parametric Conic Sections"
  plot "-t",
    "t",
    "cos(t)",
    "cos(2*t)",
    "2*cos(t)",
    "sin(t)",
    "-cosh(t)",
    "sinh(t)"
end
```
![011param/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/004.png)

### 5

```ruby
# set title ""
# 
# set xrange [-5:5]
# set yrange [-5:5]
# plot tan(t),t,t,tan(t)

Numo.gnuplot do
  set title:""
  set xrange:-5..5
  set yrange:-5..5
  plot "tan(t)",
    "t",
    "t",
    "tan(t)"
end
```
![011param/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/005.png)

### 6

```ruby
# set trange [0.00001:3]
# plot t,log(t),-t,log(t),sin(t),t**2,-sin(t),t**2

Numo.gnuplot do
  set trange:0.00001..3
  plot "t",
    "log(t)",
    "-t",
    "log(t)",
    "sin(t)",
    "t**2",
    "-sin(t)",
    "t**2"
end
```
![011param/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/006.png)

### 7

```ruby
# set autoscale x
# set yrange [-1.5:1.5]
# set trange [0.0001:10*pi]
# plot sin(t)/t,cos(t)/t

Numo.gnuplot do
  set autoscale:"x"
  set yrange:-1.5..1.5
  set trange:"[0.0001:10*pi]"
  plot "sin(t)/t",
    "cos(t)/t"
end
```
![011param/007](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/011param/image/007.png)
