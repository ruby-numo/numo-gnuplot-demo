## simple functions
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/simple.html)

### 1

```ruby
# # Requires data files "[123].dat" from this directory,
# # so change current working directory to this directory before running.
# # gnuplot> set term <term-type>
# # gnuplot> load 'simple.dem'
# #
# set key left box
# set samples 50
# plot [-10:10] sin(x),atan(x),cos(atan(x))

Numo.gnuplot do
  set :key, :left, :box
  set samples:50
  plot  -10..10,
    "sin(x)",
    "atan(x)",
    "cos(atan(x))"
end
```
![001simple/001](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/001.png)

### 2

```ruby
# set key right nobox
# set samples 100
# plot [-pi/2:pi] cos(x),-(sin(x) > sin(x+1) ? sin(x) : sin(x+1))

Numo.gnuplot do
  set :key, :right, :nobox
  set samples:100
  plot "[-pi/2:pi]",
    "cos(x)",
    "-(sin(x) > sin(x+1) ? sin(x) : sin(x+1))"
end
```
![001simple/002](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/002.png)

### 3

```ruby
# set key left box
# set samples 200
# plot [-3:5] asin(x),acos(x)

Numo.gnuplot do
  set :key, :left, :box
  set samples:200
  plot  -3..5,
    "asin(x)",
    "acos(x)"
end
```
![001simple/003](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/003.png)

### 4

```ruby
# plot [-30:20] besj0(x)*0.12e1 with impulses, (x**besj0(x))-2.5 with points

Numo.gnuplot do
  plot  -30..20,
    ["besj0(x)*0.12e1", with:"impulses"],
    ["(x**besj0(x))-2.5", with:"points"]
end
```
![001simple/004](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/004.png)

### 5

```ruby
# set samples 400
# plot [-10:10] real(sin(x)**besj0(x))

Numo.gnuplot do
  set samples:400
  plot  -10..10,
    "real(sin(x)**besj0(x))"
end
```
![001simple/005](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/005.png)

### 6

```ruby
# set key bmargin center horizontal
# plot [-5*pi:5*pi] [-5:5] real(tan(x)/atan(x)), 1/x

Numo.gnuplot do
  set :key, :bmargin, :center, :horizontal
  plot "[-5*pi:5*pi]", -5..5,
    "real(tan(x)/atan(x))",
    "1/x"
end
```
![001simple/006](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/006.png)

### 7

```ruby
# set key left box
# set autoscale
# set samples 800
# plot [-30:20] sin(x*20)*atan(x)

Numo.gnuplot do
  set :key, :left, :box
  set :autoscale
  set samples:800
  plot  -30..20,
    "sin(x*20)*atan(x)"
end
```
![001simple/007](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/007.png)

### 8

```ruby
# plot [-19:19] '1.dat' with impulses, '2.dat', '3.dat' with lines

Numo.gnuplot do
  plot  -19..19,
    ["'1.dat'", with:"impulses"],
    "'2.dat'",
    ["'3.dat'", with:"lines"]
end
```
![001simple/008](https://raw.github.com/numo/gnuplot-demo/master/gnuplot/md/001simple/image/008.png)
