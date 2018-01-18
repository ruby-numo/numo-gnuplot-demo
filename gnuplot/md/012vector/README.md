## vector fields
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/vector.html)

### 1

```ruby
# # This file demonstrates
# # -1- saving contour lines as a gnuplottable file
# # -2- plotting a vector field on the same graph
# # -3- manipulating columns using the '$1,$2' syntax.
# # the example is taken here from Physics is the display of equipotential
# # lines and electrostatic field for a dipole (+q,-q)
#
# print "\n This file demonstrates"
# print " -1- saving contour lines as a gnuplottable file"
# print " -2- plotting a vector field on the same graph"
# print " -3- manipulating columns using the '$1,$2' syntax."
# print " the example is taken here from Physics is the display of equipotential"
# print " lines and electrostatic field for a dipole (+q,-q)"
# #
#       r(x,y)=sqrt(x*x+y*y)
#       v1(x,y)=  q1/(r((x-x0),y))
#       v2(x,y)=  q2/(r((x+x0),y))
# #
#       vtot(x,y)=v1(x,y)+v2(x,y)
# #
#       e1x(x,y)= q1*(x-x0)/r(x-x0,y)**3
#       e1y(x,y)= q1*(y)/r(x-x0,y)**3
#       e2x(x,y)= q2*(x+x0)/r(x+x0,y)**3
#       e2y(x,y)= q2*(y)/r(x+x0,y)**3
#       etotx(x,y)=e1x(x,y)+e2x(x,y)
#       etoty(x,y)=e1y(x,y)+e2y(x,y)
#       enorm(x,y)=sqrt(etotx(x,y)*etotx(x,y)+etoty(x,y)*etoty(x,y))
#       dx1(x,y)=coef*etotx(x,y)/enorm(x,y)
#       dy1(x,y)=coef*etoty(x,y)/enorm(x,y)
#       dx2(x,y)=coef*etotx(x,y)
#       dy2(x,y)=coef*etoty(x,y)
# #
#       coef=.7
#       x0=1.
#       q1=1
#       q2=-1
#       xmin=-10.
#       xmax=10.
#       ymin=-10.
#       ymax=10.
# #
# reset
# unset autoscale
# set xr [xmin:xmax]
# set yr [ymin:ymax]
# set isosam 31,31
# #set view 0, 0, 1, 1
# set view map
# unset surface
# set contour base
# set cntrparam order 4
# set cntrparam linear
# set cntrparam levels discrete -3,-2 ,-1 ,-0.5 ,-0.2 ,-0.1 ,-0.05 ,-0.02 ,0 ,0.02 ,0.05 ,0.1 ,0.2 ,0.5 ,1 ,2 ,3
# set cntrparam points 5
# #
# set label "-q" at -1,0 center
# set label "+q" at  1,0 center
# splot vtot(x,y) w l

Numo.gnuplot do
  run "r(x,y)=sqrt(x*x+y*y)"
  run "v1(x,y)= q1/(r((x-x0),y))"
  run "v2(x,y)= q2/(r((x+x0),y))"
  run "vtot(x,y)=v1(x,y)+v2(x,y)"
  run "e1x(x,y)= q1*(x-x0)/r(x-x0,y)**3"
  run "e1y(x,y)= q1*(y)/r(x-x0,y)**3"
  run "e2x(x,y)= q2*(x+x0)/r(x+x0,y)**3"
  run "e2y(x,y)= q2*(y)/r(x+x0,y)**3"
  run "etotx(x,y)=e1x(x,y)+e2x(x,y)"
  run "etoty(x,y)=e1y(x,y)+e2y(x,y)"
  run "enorm(x,y)=sqrt(etotx(x,y)*etotx(x,y)+etoty(x,y)*etoty(x,y))"
  run "dx1(x,y)=coef*etotx(x,y)/enorm(x,y)"
  run "dy1(x,y)=coef*etoty(x,y)/enorm(x,y)"
  run "dx2(x,y)=coef*etotx(x,y)"
  run "dy2(x,y)=coef*etoty(x,y)"
  run "coef=.7"
  run "x0=1."
  run "q1=1"
  run "q2=-1"
  run "xmin=-10."
  run "xmax=10."
  run "ymin=-10."
  run "ymax=10."
  reset
  unset :autoscale
  set xr:"[xmin:xmax]"
  set yr:"[ymin:ymax]"
  set isosam:[31,31]
  set view:'map'
  unset :surface
  set contour:"base"
  set :cntrparam, order:4
  set :cntrparam, "linear"
  set :cntrparam, :levels, discrete:[-3,-2,-1,-0.5,-0.2,-0.1,-0.05,-0.02,0,0.02,0.05,0.1,0.2,0.5,1,2,3]
  set :cntrparam, points:5
  set label:"-q", at:[-1,0], center:true
  set label:"+q", at:[1,0], center:true
  splot "vtot(x,y)", w:"l"
end
```
![012vector/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/012vector/image/001.png)

### 2

```ruby
# print "Now create a file with equipotential lines"
#
# set table "equipo2.tmp"
# replot
# unset table
# reset
#
# plot "equipo2.tmp" w l

Numo.gnuplot do
  set table:"equipo2.tmp"
  replot
  unset :table
  reset
  plot "\"equipo2.tmp\"", w:"l"
end
```
![012vector/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/012vector/image/002.png)

### 3

```ruby
# print "Now create a x/y datafile for plotting with vectors "
# print "and display vectors parallel to the electrostatic field"
# set isosam 31,31
#
# set table "field2xy.tmp"
# splot vtot(x,y) w l
# unset table
#
# unset autoscale
# set xr [xmin:xmax]
# set yr [ymin:ymax]
# set isosam 31,31
# set key under Left reverse
# plot "field2xy.tmp" u 1:2:(coef*dx1($1,$2)):(coef*dy1($1,$2)) w vec, \
#      "equipo2.tmp" w l

Numo.gnuplot do
  set isosam:[31,31]
  set table:"field2xy.tmp"
  splot "vtot(x,y)", w:"l"
  unset :table
  unset :autoscale
  set xr:"[xmin:xmax]"
  set yr:"[ymin:ymax]"
  set isosam:[31,31]
  set :key, "under", :Left, :reverse
  plot ["\"field2xy.tmp\"", u:'1:2:(coef*dx1($1,$2)):(coef*dy1($1,$2))', w:"vec"],
    ["\"equipo2.tmp\"", w:"l"]
end
```
![012vector/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/012vector/image/003.png)
