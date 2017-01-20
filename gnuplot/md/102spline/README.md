## B-splines
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/spline.html)

### 1

```ruby
# # Some curve plotting using common cubic polynomial basis function for cagd.
# #
# #				Gershon Elber, Aug. 1992
# #
# set xrang [0:1]
# set grid
# set key box
# 
# set yrange[-0.2:1.4]
# m0(x) = 1
# m1(x) = x
# m2(x) = x**2
# m3(x) = x**3
# set title "The cubic Monomial basis functions"
# plot m0(x), m1(x), m2(x), m3(x)

Numo.gnuplot do
  set xrang:0..1
  set :grid
  set :key, :box
  set yrange:-0.2..1.4
  run "m0(x) = 1"
  run "m1(x) = x"
  run "m2(x) = x**2"
  run "m3(x) = x**3"
  set title:"The cubic Monomial basis functions"
  plot "m0(x)",
    "m1(x)",
    "m2(x)",
    "m3(x)"
end
```
![102spline/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/102spline/image/001.png)

### 2

```ruby
# h00(x) = x**2 * ( 2 * x - 3) + 1
# h01(x) = -x**2 * (2 * x - 3)
# h10(x) = x * (x - 1)**2
# h11(x) = x**2 * (x - 1)
# 
# set title "The cubic Hermite basis functions"
# plot h00(x), h01(x), h10(x), h11(x)

Numo.gnuplot do
  run "h00(x) = x**2 * ( 2 * x - 3) + 1"
  run "h01(x) = -x**2 * (2 * x - 3)"
  run "h10(x) = x * (x - 1)**2"
  run "h11(x) = x**2 * (x - 1)"
  set title:"The cubic Hermite basis functions"
  plot "h00(x)",
    "h01(x)",
    "h10(x)",
    "h11(x)"
end
```
![102spline/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/102spline/image/002.png)

### 3

```ruby
# bez0(x) = (1 - x)**3
# bez1(x) = 3 * (1 - x)**2 * x
# bez2(x) = 3 * (1 - x) * x**2
# bez3(x) = x**3
# set title "The cubic Bezier basis functions"
# plot bez0(x), bez1(x), bez2(x), bez3(x)

Numo.gnuplot do
  run "bez0(x) = (1 - x)**3"
  run "bez1(x) = 3 * (1 - x)**2 * x"
  run "bez2(x) = 3 * (1 - x) * x**2"
  run "bez3(x) = x**3"
  set title:"The cubic Bezier basis functions"
  plot "bez0(x)",
    "bez1(x)",
    "bez2(x)",
    "bez3(x)"
end
```
![102spline/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/102spline/image/003.png)

### 4

```ruby
# bsp0(x) = ( 1 - 3 * x + 3 * x**2 - x**3 ) / 6;
# bsp1(x) = ( 4 - 6 * x**2 + 3 * x**3 ) / 6;
# bsp2(x) = ( 1 + 3 * x + 3 * x**2 - 3 * x**3 ) / 6
# bsp3(x) = x**3 / 6
# set title "The cubic uniform Bspline basis functions"
# plot bsp0(x), bsp1(x), bsp2(x), bsp3(x)

Numo.gnuplot do
  run "bsp0(x) = ( 1 - 3 * x + 3 * x**2 - x**3 ) / 6;"
  run "bsp1(x) = ( 4 - 6 * x**2 + 3 * x**3 ) / 6;"
  run "bsp2(x) = ( 1 + 3 * x + 3 * x**2 - 3 * x**3 ) / 6"
  run "bsp3(x) = x**3 / 6"
  set title:"The cubic uniform Bspline basis functions"
  plot "bsp0(x)",
    "bsp1(x)",
    "bsp2(x)",
    "bsp3(x)"
end
```
![102spline/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/102spline/image/004.png)

### 5

```ruby
# y0 = 1
# y1 = 0.2
# y2 = 0.8
# y3 = 0
# 
# x0 = 0
# x1 = 0.33
# x2 = 0.66
# x3 = 1
# 
# xv0 = -0.3
# yv0 = 0.5
# xv1 = -0.4
# yv1 = 0.2
# 
# set arrow from x0,y0 to x1,y1 nohead
# set arrow from x1,y1 to x2,y2 nohead
# set arrow from x2,y2 to x3,y3 nohead
# 
# cub_bezier_x(t) = bez0(t) * x0 + bez1(t) * x1 + bez2(t) * x2 + bez3(t) * x3
# cub_bezier_y(t) = bez0(t) * y0 + bez1(t) * y1 + bez2(t) * y2 + bez3(t) * y3
# cub_bsplin_x(t) = bsp0(t) * x0 + bsp1(t) * x1 + bsp2(t) * x2 + bsp3(t) * x3
# cub_bsplin_y(t) = bsp0(t) * y0 + bsp1(t) * y1 + bsp2(t) * y2 + bsp3(t) * y3
# 
# set parametric
# set trange [0:1]
# set title "The cubic Bezier/Bspline basis functions in use"
# plot cub_bezier_x(t), cub_bezier_y(t) with lines lt 2,\
#      cub_bsplin_x(t), cub_bsplin_y(t) with lines lt 3

Numo.gnuplot do
  run "y0 = 1"
  run "y1 = 0.2"
  run "y2 = 0.8"
  run "y3 = 0"
  run "x0 = 0"
  run "x1 = 0.33"
  run "x2 = 0.66"
  run "x3 = 1"
  run "xv0 = -0.3"
  run "yv0 = 0.5"
  run "xv1 = -0.4"
  run "yv1 = 0.2"
  set :arrow, from:"x0,y0", to:"x1,y1", nohead:true
  set :arrow, from:"x1,y1", to:"x2,y2", nohead:true
  set :arrow, from:"x2,y2", to:"x3,y3", nohead:true
  run "cub_bezier_x(t) = bez0(t) * x0 + bez1(t) * x1 + bez2(t) * x2 + bez3(t) * x3"
  run "cub_bezier_y(t) = bez0(t) * y0 + bez1(t) * y1 + bez2(t) * y2 + bez3(t) * y3"
  run "cub_bsplin_x(t) = bsp0(t) * x0 + bsp1(t) * x1 + bsp2(t) * x2 + bsp3(t) * x3"
  run "cub_bsplin_y(t) = bsp0(t) * y0 + bsp1(t) * y1 + bsp2(t) * y2 + bsp3(t) * y3"
  set :parametric
  set trange:0..1
  set title:"The cubic Bezier/Bspline basis functions in use"
  plot "cub_bezier_x(t)",
    ["cub_bezier_y(t)", with:"lines", lt:2],
    "cub_bsplin_x(t)",
    ["cub_bsplin_y(t)", with:"lines", lt:3]
end
```
![102spline/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/102spline/image/005.png)

### 6

```ruby
# unset arrow
# #
# # Note the arrows here, scaled by 1/3 so they will fit into plotting area
# #
# set arrow from x1,y1 to x1+xv0/3,y1+yv0/3
# set arrow from x2,y2 to x2+xv1/3,y2+yv1/3
# set arrow from x1,y1 to x1+xv0,y1+yv0
# set arrow from x2,y2 to x2+xv1,y2+yv1
# 
# cub_hermit_x1(t) = h00(t) * x1 + h01(t) * x2 + h10(t) * xv0 + h11(t) * xv1
# cub_hermit_y1(t) = h00(t) * y1 + h01(t) * y2 + h10(t) * yv0 + h11(t) * yv1
# cub_hermit_x2(t) = h00(t) * x1 + h01(t) * x2 + h10(t) * xv0*3 + h11(t) * xv1*3
# cub_hermit_y2(t) = h00(t) * y1 + h01(t) * y2 + h10(t) * yv0*3 + h11(t) * yv1*3
# set title "The cubic Hermite basis functions in use"
# plot cub_hermit_x1(t), cub_hermit_y1(t) with lines lt 2,\
#      cub_hermit_x2(t), cub_hermit_y2(t) with lines lt 3

Numo.gnuplot do
  unset :arrow
  set :arrow, from:"x1,y1", to:"x1+xv0/3,y1+yv0/3"
  set :arrow, from:"x2,y2", to:"x2+xv1/3,y2+yv1/3"
  set :arrow, from:"x1,y1", to:"x1+xv0,y1+yv0"
  set :arrow, from:"x2,y2", to:"x2+xv1,y2+yv1"
  run "cub_hermit_x1(t) = h00(t) * x1 + h01(t) * x2 + h10(t) * xv0 + h11(t) * xv1"
  run "cub_hermit_y1(t) = h00(t) * y1 + h01(t) * y2 + h10(t) * yv0 + h11(t) * yv1"
  run "cub_hermit_x2(t) = h00(t) * x1 + h01(t) * x2 + h10(t) * xv0*3 + h11(t) * xv1*3"
  run "cub_hermit_y2(t) = h00(t) * y1 + h01(t) * y2 + h10(t) * yv0*3 + h11(t) * yv1*3"
  set title:"The cubic Hermite basis functions in use"
  plot "cub_hermit_x1(t)",
    ["cub_hermit_y1(t)", with:"lines", lt:2],
    "cub_hermit_x2(t)",
    ["cub_hermit_y2(t)", with:"lines", lt:3]
end
```
![102spline/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/102spline/image/006.png)
