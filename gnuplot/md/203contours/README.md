## contours
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/contours.html)

### 1

```ruby
# set samples 20
# set isosamples 21
# set xlabel "X axis"
# set ylabel "Y axis"
# set zlabel "Z axis" offset 1, 0
# set view 60, 30, 0.85, 1.1
# set title "3D gnuplot demo - contour plot"
# set contour
# splot x*y

Numo.gnuplot do
  set samples:20
  set isosamples:21
  set xlabel:"X axis"
  set ylabel:"Y axis"
  set zlabel:"Z axis", offset:[1,0]
  set view:[60,30,0.85,1.1]
  set title:"3D gnuplot demo - contour plot"
  set :contour
  splot "x*y"
end
```
![203contours/001](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/001.png)

### 2

```ruby
# set cntrparam levels 20
# set title "3D gnuplot demo - contour plot (more contours)"
# replot

Numo.gnuplot do
  set :cntrparam, levels:20
  set title:"3D gnuplot demo - contour plot (more contours)"
  replot
end
```
![203contours/002](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/002.png)

### 3

```ruby
# set cntrparam levels incr -100,10,100
# set title "3D gnuplot demo - contour plot (every 10, starting at -100)"
# replot

Numo.gnuplot do
  set :cntrparam, :levels, incr:[-100,10,100]
  set title:"3D gnuplot demo - contour plot (every 10, starting at -100)"
  replot
end
```
![203contours/003](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/003.png)

### 4

```ruby
# set cntrparam levels disc -75,-50,0
# set title "3D gnuplot demo - contour plot (at -75, -50, 0)"
# replot

Numo.gnuplot do
  set :cntrparam, :levels, disc:[-75,-50,0]
  set title:"3D gnuplot demo - contour plot (at -75, -50, 0)"
  replot
end
```
![203contours/004](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/004.png)

### 5

```ruby
# set cntrparam levels auto 10
# set title "3D gnuplot demo - contour plot on base grid"
# set contour base
# splot x**2-y**2

Numo.gnuplot do
  set :cntrparam, :levels, auto:10
  set title:"3D gnuplot demo - contour plot on base grid"
  set contour:"base"
  splot "x**2-y**2"
end
```
![203contours/005](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/005.png)

### 6

```ruby
# set title "3D gnuplot demo - contour plot on surface"
# set contour surface
# replot

Numo.gnuplot do
  set title:"3D gnuplot demo - contour plot on surface"
  set :contour, :surface
  replot
end
```
![203contours/006](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/006.png)

### 7

```ruby
# set title "3D gnuplot demo - contour plot on both"
# set contour both
# replot

Numo.gnuplot do
  set title:"3D gnuplot demo - contour plot on both"
  set contour:"both"
  replot
end
```
![203contours/007](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/007.png)

### 8

```ruby
# set contour base
# set title "3D gnuplot demo - 2 surfaces"
# splot x**2*y**3, x**3*y**2

Numo.gnuplot do
  set contour:"base"
  set title:"3D gnuplot demo - 2 surfaces"
  splot "x**2*y**3",
    "x**3*y**2"
end
```
![203contours/008](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/008.png)

### 9

```ruby
# set title "3D gnuplot demo - some more interesting contours"
# splot x*y / (x**2 + y**2 + 0.1)

Numo.gnuplot do
  set title:"3D gnuplot demo - some more interesting contours"
  splot "x*y / (x**2 + y**2 + 0.1)"
end
```
![203contours/009](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/009.png)

### 10

```ruby
# splot [x=-3:3] [y=-3:3] sin(x) * cos(y)

Numo.gnuplot do
  splot "[x=-3:3]","[y=-3:3]",
    "sin(x) * cos(y)"
end
```
![203contours/010](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/010.png)

### 11

```ruby
# set zrange [-1.0:1.0]
# replot

Numo.gnuplot do
  set zrange:-1.0..1.0
  replot
end
```
![203contours/011](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/011.png)

### 12

```ruby
# set samples 6
# set isosamples 6
# set cntrparam levels 5
# set title "3D gnuplot demo - low resolution (6x6)"
# replot

Numo.gnuplot do
  set samples:6
  set isosamples:6
  set :cntrparam, levels:5
  set title:"3D gnuplot demo - low resolution (6x6)"
  replot
end
```
![203contours/012](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/012.png)

### 13

```ruby
# set cntrparam bspline
# set title "3D gnuplot demo - low resolution (6x6) using bspline approx."
# replot

Numo.gnuplot do
  set :cntrparam, "bspline"
  set title:"3D gnuplot demo - low resolution (6x6) using bspline approx."
  replot
end
```
![203contours/013](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/013.png)

### 14

```ruby
# set cntrparam order 8
# set title "3D gnuplot demo - low resolution (6x6) raise bspline order."
# replot

Numo.gnuplot do
  set :cntrparam, order:8
  set title:"3D gnuplot demo - low resolution (6x6) raise bspline order."
  replot
end
```
![203contours/014](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/014.png)

### 15

```ruby
# set cntrparam linear
# set auto
# set title "3D gnuplot demo - low resolution (6x6) using linear contours."
# splot x*y

Numo.gnuplot do
  set :cntrparam, "linear"
  set :auto
  set title:"3D gnuplot demo - low resolution (6x6) using linear contours."
  splot "x*y"
end
```
![203contours/015](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/015.png)

### 16

```ruby
# set cntrparam order 4
# set cntrparam bspline
# set title "3D gnuplot demo - low resolution (6x6) using bspline approx."
# replot

Numo.gnuplot do
  set :cntrparam, order:4
  set :cntrparam, "bspline"
  set title:"3D gnuplot demo - low resolution (6x6) using bspline approx."
  replot
end
```
![203contours/016](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/016.png)

### 17

```ruby
# set samples 25
# set isosamples 26
# set title "3D gnuplot demo - contour of Sinc function"
# splot [-5:5.01] [-5:5.01] sin(sqrt(x**2+y**2)) / sqrt(x**2+y**2)

Numo.gnuplot do
  set samples:25
  set isosamples:26
  set title:"3D gnuplot demo - contour of Sinc function"
  splot  -5..5.01, -5..5.01,
    "sin(sqrt(x**2+y**2)) / sqrt(x**2+y**2)"
end
```
![203contours/017](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/017.png)

### 18

```ruby
# splot [-12:12.01] [-12:12.01] sin(sqrt(x**2+y**2)) / sqrt(x**2+y**2)

Numo.gnuplot do
  splot  -12..12.01, -12..12.01,
    "sin(sqrt(x**2+y**2)) / sqrt(x**2+y**2)"
end
```
![203contours/018](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/018.png)

### 19

```ruby
# set cntrparam levels 10
# set auto
# set zrange [-1.0:1.0]
# set style data lines
# set title "3D gnuplot demo - contour of data grid plotting"
# set parametric
# splot "glass.dat"

Numo.gnuplot do
  set :cntrparam, levels:10
  set :auto
  set zrange:-1.0..1.0
  set :style, :data, :lines
  set title:"3D gnuplot demo - contour of data grid plotting"
  set :parametric
  splot "\"glass.dat\""
end
```
![203contours/019](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/019.png)

### 20

```ruby
# set xrange [0:15]
# set yrange [0:15]
# set zrange [-1.2:1.2]
# unset parametric
# splot "glass.dat" using 1

Numo.gnuplot do
  set xrange:0..15
  set yrange:0..15
  set zrange:-1.2..1.2
  unset :parametric
  splot "\"glass.dat\"", using:1
end
```
![203contours/020](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/020.png)

### 21

```ruby
# set view map
# unset surface
# set title "3D gnuplot demo - 2D contour projection of last plot"
# replot

Numo.gnuplot do
  set view:'map'
  unset :surface
  set title:"3D gnuplot demo - 2D contour projection of last plot"
  replot
end
```
![203contours/021](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/021.png)

### 22

```ruby
# #From: shen@athena.cs.uga.edu (Mingzuo Shen)
# #Subject: Rosenbrock's function: some answers and thanks
# #Date: Wed, 23 Jun 1993 20:50:36 GMT
# #
# #    Last night I asked for help with a contour plot for the function:
# #
# #    (1-x)**2 + 100 * (y - x**2)**2
# #
# #which should have a minimum at (x=1,y=1). This is the 2D case of a more
# #general function named after Rosenbrock (the book I am reading does not
# #give a reference to any paper/book by this person):
# #
# #    for even integer n,
# #
# #    f(x) = \sum_{j=1,3,5,\ldots,n} [(1 - x_j)^2 + 100(x_{j+1} - x_j^2)^2]
# #
# #where x is a vector (x1, x2, ..., x_n). This function also have a minimum
# #at (1,1,...,1), which lies at the base of a "banana-shaped valley".
# #Here are the new commands I have tried.
# #
# set auto
# set surface
# unset contour
# set cntrparam levels 5
# set cntrparam linear
# set samples 100
# set logscale z
# set hidden3d
# set isosamples 20
# set view 70,335,1,1
# set xlabel "x"
# set ylabel "y"
# set title "Rosenbrock Function"
# splot [0.9:1.1] [0.9:1.1] (1-x)**2 + 100*(y - x**2)**2

Numo.gnuplot do
  set :auto
  set :surface
  unset :contour
  set :cntrparam, levels:5
  set :cntrparam, "linear"
  set samples:100
  set logscale:"z"
  set :hidden3d
  set isosamples:20
  set view:[70,335,1,1]
  set xlabel:"x"
  set ylabel:"y"
  set title:"Rosenbrock Function"
  splot  0.9..1.1, 0.9..1.1,
    "(1-x)**2 + 100*(y - x**2)**2"
end
```
![203contours/022](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/022.png)

### 23

```ruby
# set logscale z
# set hidden3d
# set isosamples 60
# set ticslevel 0.
# set view 20,340	#HBB: ,1,2
# set xlabel "x"
# set ylabel "y"
# splot [-1.5:1.5] [-0.5:1.5] (1-x)**2 + 100*(y - x**2)**2

Numo.gnuplot do
  set logscale:"z"
  set :hidden3d
  set isosamples:60
  set ticslevel:0.0
  set view:[20,340]	#HBB: ,1,2
  set xlabel:"x"
  set ylabel:"y"
  splot  -1.5..1.5, -0.5..1.5,
    "(1-x)**2 + 100*(y - x**2)**2"
end
```
![203contours/023](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/023.png)

### 24

```ruby
# set contour
# unset surface
# unset ztics
# unset zlabel
# set border 15
# replot

Numo.gnuplot do
  set :contour
  unset :surface
  unset :ztics
  unset :zlabel
  set border:15
  replot
end
```
![203contours/024](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/024.png)

### 25

```ruby
# set title "All contours drawn in a single color"
# unset clabel
# splot [-1.5:1.5] [-0.5:1.5] (1-x)**2 + 100*(y - x**2)**2 with lines lc rgb "#007700"

Numo.gnuplot do
  set title:"All contours drawn in a single color"
  unset :clabel
  splot  -1.5..1.5, -0.5..1.5,
    "(1-x)**2 + 100*(y - x**2)**2", with:"lines", lc_rgb:"#007700"
end
```
![203contours/025](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/203contours/image/025.png)
