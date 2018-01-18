## parameter fitting
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/fit.html)

### 1

```ruby
# print "Some examples how data fitting using nonlinear least squares fit"
# print "can be done."
# print ""
#
# reset
# set title 'data for first fit demo'
# set xlabel "Temperature T  [deg Cels.]"
# set ylabel "Density [g/cm3]"
# set key below
# plot 'lcdemo.dat'

Numo.gnuplot do
  reset
  set title:'data for first fit demo'
  set xlabel:"Temperature T  [deg Cels.]"
  set ylabel:"Density [g/cm3]"
  set :key, "below"
  plot "'lcdemo.dat'"
end
```
![104fit/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/001.png)

### 2

```ruby
# print "now fitting a straight line to the data :-)"
# print "only as a demo without physical meaning"
# load 'line.fnc'
# y0 = 0.0
# m = 0.0
# print "fit function and initial parameters are as follows:"
# print GPFUN_l
# show variables y0
# show variables m
# #show variables
# set title 'all fit params set to 0'
# plot [*:*][-.1:1.2] 'lcdemo.dat', l(x)

Numo.gnuplot do
  load 'line.fnc'
  run "y0 = 0.0"
  run "m = 0.0"
  show "variables y0"
  show "variables", :m
  set title:'all fit params set to 0'
  plot "[*:*]", -0.1..1.2,
    "'lcdemo.dat'",
    "l(x)"
end
```
![104fit/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/002.png)

### 3

```ruby
# print "fit command will be: fit l(x) 'lcdemo.dat' via y0, m"
# fit l(x) 'lcdemo.dat' via y0, m
# set title 'unweighted fit'
# plot 'lcdemo.dat', l(x)

Numo.gnuplot do
  fit 'l(x)', 'lcdemo.dat', via:'y0, m'
  set title:'unweighted fit'
  plot "'lcdemo.dat'",
    "l(x)"
end
```
![104fit/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/003.png)

### 4

```ruby
# print ""
# print "now fit with weights from column 3 which favor low temperatures"
# print "command will be: fit l(x) 'lcdemo.dat' using 1:2:3 via y0, m"
# fit l(x) 'lcdemo.dat' using 1:2:3 via y0, m
# set title 'fit weighted towards low temperatures'
# plot 'lcdemo.dat', l(x)

Numo.gnuplot do
  fit 'l(x)', 'lcdemo.dat', using:[1,2,3], via:'y0, m'
  set title:'fit weighted towards low temperatures'
  plot "'lcdemo.dat'",
    "l(x)"
end
```
![104fit/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/004.png)

### 5

```ruby
# print ""
# print "now fit with weights from column 4 instead"
# print "command will be: fit l(x) 'lcdemo.dat' using 1:2:4 via y0, m"
# fit l(x) 'lcdemo.dat' using 1:2:4 via y0, m
# set title 'bias to high-temperates'
# plot 'lcdemo.dat', l(x)

Numo.gnuplot do
  fit 'l(x)', 'lcdemo.dat', using:[1,2,4], via:'y0, m'
  set title:'bias to high-temperates'
  plot "'lcdemo.dat'",
    "l(x)"
end
```
![104fit/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/005.png)

### 6

```ruby
# set title 'data with experimental errors'
# plot 'lcdemo.dat' using 1:2:5 with errorbars

Numo.gnuplot do
  set title:'data with experimental errors'
  plot "'lcdemo.dat'", using:[1,2,5], with:"errorbars"
end
```
![104fit/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/006.png)

### 7

```ruby
# print ""
# print "now use these real single-measurement errors from column 5 to reach "
# print "such a result (look at the file lcdemo.dat and compare the columns to "
# print "see the difference)"
# print "command will be: fit l(x) 'lcdemo.dat' using 1:2:5 via y0, m"
# fit l(x) 'lcdemo.dat' using 1:2:5 via y0, m
# set title 'fit weighted by experimental errors'
# plot 'lcdemo.dat' using 1:2:5 with errorbars, l(x)

Numo.gnuplot do
  fit 'l(x)', 'lcdemo.dat', using:[1,2,5], via:'y0, m'
  set title:'fit weighted by experimental errors'
  plot ["'lcdemo.dat'", using:[1,2,5], with:"errorbars"],
    "l(x)"
end
```
![104fit/007](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/007.png)

### 8

```ruby
# load 'density.fnc'
# set title 'initial parameters for realistic model function'
# plot 'lcdemo.dat', density(x)

Numo.gnuplot do
  load 'density.fnc'
  set title:'initial parameters for realistic model function'
  plot "'lcdemo.dat'",
    "density(x)"
end
```
![104fit/008](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/008.png)

### 9

```ruby
# print ""
# print "It's time now to try a more realistic model function:"
# print GPFUN_density
# print GPFUN_curve
# print GPFUN_lowlin
# print GPFUN_high
# #show functions
# print "density(x) is a function which shall fit the whole temperature"
# print "range using a ?: expression. It contains 6 model parameters which"
# print "will all be varied. Now take the start parameters out of the"
# print "file 'start.par' and plot the function."
# print "command will be: fit density(x) 'lcdemo.dat' via 'start.par'"
# load 'start.par'
# fit density(x) 'lcdemo.dat' via 'start.par'
# set title 'fitted to realistic model function'
# plot 'lcdemo.dat', density(x)

Numo.gnuplot do
  load 'start.par'
  fit 'density(x)', 'lcdemo.dat', via:"'start.par'"
  set title:'fitted to realistic model function'
  plot "'lcdemo.dat'",
    "density(x)"
end
```
![104fit/009](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/009.png)

### 10

```ruby
# print  ""
# print  "looks already rather nice? We will do now the following: set"
# print  "the epsilon limit higher so that we need more iteration steps"
# print  "to convergence. During fitting please hit ctrl-C. You will be asked"
# print  "Stop, Continue, Execute: Try everything. You may define a script"
# print  "using the FIT_SCRIPT environment variable. An example would be"
# print  "'FIT_SCRIPT=plot nonsense.dat'. Normally you don't need to set"
# print  "FIT_SCRIPT since it defaults to 'replot'. Please note that FIT_SCRIPT"
# print  "cannot be set from inside gnuplot."
# print  ""
# print  "command will be: fit density(x) 'lcdemo.dat' via 'start.par'"
# FIT_LIMIT = 1e-10
# fit density(x) 'lcdemo.dat' via 'start.par'
# set title 'fit with more iterations'
# plot 'lcdemo.dat', density(x)

Numo.gnuplot do
  run "FIT_LIMIT = 1e-10"
  fit 'density(x)', 'lcdemo.dat', via:"'start.par'"
  set title:'fit with more iterations'
  plot "'lcdemo.dat'",
    "density(x)"
end
```
![104fit/010](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/010.png)

### 11

```ruby
# FIT_LIMIT = 1e-5
# print "\nNow a brief demonstration of 3d fitting."
# print "hemisphr.dat contains random points on a hemisphere of"
# print "radius 1, but we let fit figure this out for us."
# print "It takes many iterations, so we limit FIT_MAXITER to 50."
# #HBB: made this a lot harder: also fit the center of the sphere
# #h(x,y) = sqrt(r*r - (x-x0)**2 - (y-y0)**2) + z0
# #HBB 970522: distort the function, so it won't fit exactly:
# h(x,y) = sqrt(r*r - (abs(x-x0))**2.2 - (abs(y-y0))**1.8) + z0
# x0 = 0.1
# y0 = 0.2
# z0 = 0.3
# r=0.5
# FIT_MAXITER=50
# set title 'the scattered points, and the initial parameter'
# splot 'hemisphr.dat' using 1:2:3, h(x,y)

Numo.gnuplot do
  run "FIT_LIMIT = 1e-5"
  run "h(x,y) = sqrt(r*r - (abs(x-x0))**2.2 - (abs(y-y0))**1.8) + z0"
  run "x0 = 0.1"
  run "y0 = 0.2"
  run "z0 = 0.3"
  run "r=0.5"
  run "FIT_MAXITER=50"
  set title:'the scattered points, and the initial parameter'
  splot ["'hemisphr.dat'", using:[1,2,3]],
    "h(x,y)"
end
```
![104fit/011](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/011.png)

### 12

```ruby
# print "fit function will be: " . GPFUN_h
# print "we *must* provide 4 columns for a 3d fit. We fake errors=1"
# print "command will be: fit h(x,y) 'hemisphr.dat' using 1:2:3:(1) via r, x0,y0,z0"
#
# # we *must* provide 4 columns for a 3d fit. We fake errors=1
# fit h(x,y) 'hemisphr.dat' using 1:2:3:(1) via r, x0, y0, z0
# set title 'the scattered points, fitted curve'
# splot 'hemisphr.dat' using 1:2:3, h(x,y)

Numo.gnuplot do
  fit 'h(x,y)', 'hemisphr.dat', using:'1:2:3:(1)', via:'r, x0, y0, z0'
  set title:'the scattered points, fitted curve'
  splot ["'hemisphr.dat'", using:[1,2,3]],
    "h(x,y)"
end
```
![104fit/012](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/012.png)

### 13

```ruby
# print "\n\nNotice, however, that this would converge much faster when"
# print "fitted in a more appropriate co-ordinate system:"
# print "fit r 'hemisphr.dat' using 0:($1*$1+$2*$2+$3*$3) via r"
# print "where we are fitting f(x)=r to the radii calculated as the data"
# print "is read from the file. No x value is required in this case."
# FIT_MAXITER=0   # no limit : we cannot delete the variable once set
#
# print "\n\nNow an example how to fit multi-branch functions\n"
# print  "The model consists of two branches, the first describing longitudinal"
# print  "sound velocity as function of propagation direction (upper data, from "
# print  "dataset 1), the second describing transverse sound velocity (lower "
# print  "data, from dataset 0).\n"
# print  "The model uses these data in order to fit elastic stiffnesses"
# print  "which occur differently in both branches."
# load 'hexa.fnc'
# load 'sound.par'
# set title 'sound data, and model with initial parameters'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  run "FIT_MAXITER=0 # no limit : we cannot delete the variable once set"
  load 'hexa.fnc'
  load 'sound.par'
  set title:'sound data, and model with initial parameters'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/013](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/013.png)

### 14

```ruby
# print ""
# print "fit function will be: " . GPFUN_f
# print GPFUN_vlong
# print GPFUN_vtrans
# print "y will be the index of the dataset"
# print "command will be: fit f(x,y) 'soundvel.dat' using 1:-2:2:(1) via 'sound.par'"
# # Must provide an error estimate for a 3d fit. Use constant 1
# fit f(x,y) 'soundvel.dat' using 1:-2:2:(1) via 'sound.par'
# #create soundfit.par, reading from sound.par and updating values
# update 'sound.par' 'soundfit.par'
# print  ""
# set title 'pseudo-3d multi-branch fit to velocity data'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  fit 'f(x,y)', 'soundvel.dat', using:'1:-2:2:(1)', via:"'sound.par'"
  update 'sound.par', 'soundfit.par'
  set title:'pseudo-3d multi-branch fit to velocity data'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/014](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/014.png)

### 15

```ruby
# print  "Look at the file 'hexa.fnc' to see how the branches are realized"
# print  "using the data index as a pseudo-3d fit"
# print  ""
# print  "Next we only use every fifth data point for fitting by using the"
# print  "'every' keyword. Look at the fitting-speed increase and at"
# print  "fitting result."
# print  "command will be: fit f(x,y) 'soundvel.dat' every 5 using 1:-2:2:(1) via 'sound.par'"
# load 'sound.par'
# fit f(x,y) 'soundvel.dat' every 5 using 1:-2:2:(1) via 'sound.par'
# set title 'fitted only every 5th data point'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  load 'sound.par'
  fit 'f(x,y)', 'soundvel.dat', every:5, using:'1:-2:2:(1)', via:"'sound.par'"
  set title:'fitted only every 5th data point'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/015](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/015.png)

### 16

```ruby
# print  "When you compare the results (see 'fit.log') you remark that"
# print  "the uncertainties in the fitted constants have become larger,"
# print  "the quality of the plot is only slightly affected."
# print  ""
# print  "By marking some parameters as '# FIXED' in the parameter file"
# print  "you fit only the others (c44 and c13 fixed here)."
# print  ""
# load 'sound2.par'
# set title 'initial parameters'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  load 'sound2.par'
  set title:'initial parameters'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/016](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/016.png)

### 17

```ruby
# fit f(x,y) 'soundvel.dat' using 1:-2:2:(1) via 'sound2.par'
# set title 'fit with c44 and c13 fixed'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  fit 'f(x,y)', 'soundvel.dat', using:'1:-2:2:(1)', via:"'sound2.par'"
  set title:'fit with c44 and c13 fixed'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/017](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/017.png)

### 18

```ruby
# print  "This has the same effect as specifying only the real free"
# print  "parameters by the 'via' syntax."
# print  ""
# print  "fit f(x) 'soundvel.dat' via c33, c11, phi0"
# print  ""
# load 'sound.par'
# set title 'initial parameters'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  load 'sound.par'
  set title:'initial parameters'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/018](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/018.png)

### 19

```ruby
# fit f(x,y) 'soundvel.dat' using 1:-2:2:(1) via c33, c11, phi0
# set title 'fit via c33,c11,phi0'
# plot 'soundvel.dat', vlong(x), vtrans(x)

Numo.gnuplot do
  fit 'f(x,y)', 'soundvel.dat', using:'1:-2:2:(1)', via:'c33, c11, phi0'
  set title:'fit via c33,c11,phi0'
  plot "'soundvel.dat'",
    "vlong(x)",
    "vtrans(x)"
end
```
![104fit/019](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/019.png)

### 20

```ruby
# print  "Here comes an example of a very complex function..."
# print  ""
#
# set xlabel "Delta [degrees]"
# set ylabel "Reflectivity"
# set title 'raw data'
# #HBB 970522: here and below, use the error column present in moli3.dat:
# plot 'moli3.dat' w e

Numo.gnuplot do
  set xlabel:"Delta [degrees]"
  set ylabel:"Reflectivity"
  set title:'raw data'
  plot "'moli3.dat'", w:"e"
end
```
![104fit/020](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/020.png)

### 21

```ruby
# print "now fitting the model function to the data"
# load 'reflect.fnc'
#
# #HBB 970522: Changed initial values to something sensible, i.e.
# #  something an experienced user of fit would actually use.
# #  FIT_LIMIT is also raised, to ensure a better fit.
# eta = 1.2e-4
# tc = 1.8e-3
# FIT_LIMIT=1e-10
#
# #show variables
# #show functions
# set title 'initial parameters'
# plot 'moli3.dat' w e, R(x)

Numo.gnuplot do
  load 'reflect.fnc'
  run "eta = 1.2e-4"
  run "tc = 1.8e-3"
  run "FIT_LIMIT=1e-10"
  set title:'initial parameters'
  plot ["'moli3.dat'", w:"e"],
    "R(x)"
end
```
![104fit/021](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/021.png)

### 22

```ruby
# print "fit function is: " . GPFUN_R
# print GPFUN_a
# print GPFUN_W
# print "command will be: fit R(x) 'moli3.dat' u 1:2:3 via eta, tc"
# fit R(x) 'moli3.dat' u 1:2:3 via eta, tc
# set title 'fitted parameters'
# replot

Numo.gnuplot do
  fit 'R(x)', 'moli3.dat', u:[1,2,3], via:'eta, tc'
  set title:'fitted parameters'
  replot
end
```
![104fit/022](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/022.png)

### 23

```ruby
# #HBB 970522: added comment on result of last fit.
# print "Looking at the plot of the resulting fit curve, you can see"
# print "that this function doesn't really fit this set of data points."
# print "This would normally be a reason to check for measurement problems"
# print "not yet accounted for, and maybe even re-think the theoretic"
# print "prediction in use."
# print ""
#
# reset
# set xlabel 'x'
# set ylabel 'y'
# set zlabel 'z'
# set ticslevel .2
# set zrange [-3:3]
# splot 'fit3.dat' index 0 using 1:2:4

Numo.gnuplot do
  reset
  set xlabel:'x'
  set ylabel:'y'
  set zlabel:'z'
  set ticslevel:0.2
  set zrange:-3..3
  splot "'fit3.dat'", index:0, using:[1,2,4]
end
```
![104fit/023](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/023.png)

### 24

```ruby
# print ''
# print 'Next we show a fit with three independent variables.  The file'
# print 'fit3.dat has four columns, with values of the three independent'
# print 'variable x, y, and t, and the resulting value z.  The data'
# print 'lines are in four sections, with t being constant within each'
# print 'section.  The sections are separated by two blank lines, so we'
# print 'can select sections with "index" modifiers.  Here are the data in'
# print 'the first section, where t = -3.'
# print ''
# print 'We will fit the function a0/(1 + a1*x**2 + a2*y**2) to these'
# print 'data. Since at this point we have two independent variables,'
# print 'our "using" spec has four entries, representing x:y:z:s (where'
# print 's is the estimated error in the z value).'
#
# print "Command will be: "
# print "  fit a0/(1+a1*x**2+a2*y**2) 'fit3.dat' index 0 using 1:2:4:(1) via a0,a1,a2"
# a0=1; a1=.1; a2=.1
# fit a0/(1+a1*x**2+a2*y**2) 'fit3.dat' index 0 using 1:2:4:(1) via a0,a1,a2
# splot a0/(1+a1*x**2+a2*y**2), 'fit3.dat' in 0 u 1:2:4

Numo.gnuplot do
  run "a0=1; a1=.1; a2=.1"
  fit 'a0/(1+a1*x**2+a2*y**2)', 'fit3.dat', index:0, using:'1:2:4:(1)', via:'a0,a1,a2'
  splot "a0/(1+a1*x**2+a2*y**2)",
    ["'fit3.dat'", in:0, u:[1,2,4]]
end
```
![104fit/024](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/024.png)

### 25

```ruby
# splot a0/(1+a1*x**2+a2*y**2), 'fit3.dat' in 3 u 1:2:4

Numo.gnuplot do
  splot "a0/(1+a1*x**2+a2*y**2)",
    ["'fit3.dat'", in:3, u:[1,2,4]]
end
```
![104fit/025](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/025.png)

### 26

```ruby
# print ""
# print "Here is the last set of data where t = 3."
# print "We fit the same function to this set."
# print "Command will be: "
# print "  fit a0/(1+a1*x**2+a2*y**2) 'fit3.dat' in 3 u 1:2:4:(1) via a0,a1,a2"
# fit a0/(1+a1*x**2+a2*y**2) 'fit3.dat' in 3 u 1:2:4:(1) via a0,a1,a2
# splot a0/(1+a1*x**2+a2*y**2), 'fit3.dat' in 3 u 1:2:4

Numo.gnuplot do
  fit 'a0/(1+a1*x**2+a2*y**2)', 'fit3.dat', in:3, u:'1:2:4:(1)', via:'a0,a1,a2'
  splot "a0/(1+a1*x**2+a2*y**2)",
    ["'fit3.dat'", in:3, u:[1,2,4]]
end
```
![104fit/026](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/026.png)

### 27

```ruby
# splot a0/(1+a1*x**2+a2*y**2), 'fit3.dat' u 1:2:4

Numo.gnuplot do
  splot "a0/(1+a1*x**2+a2*y**2)",
    ["'fit3.dat'", u:[1,2,4]]
end
```
![104fit/027](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/027.png)

### 28

```ruby
# print ""
# print "We also have data for several intermediate values of t.  We"
# print "will fit the function f(x,y,t)=a0*t/(1+a1*x**2+a2*y**2) to all"
# print "the data.  Since there are now three independent variables, we"
# print "need a using spec with five entries, representing x:y:t:z:s."
# print "Command will be: "
# print "  fit f(x,y,t) 'fit3.dat' u 1:2:3:4:(1) via a0,a1,a2"
# f(x,y,t)=a0*t/(1+a1*x**2+a2*y**2)
# fit f(x,y,t) 'fit3.dat' u 1:2:3:4:(1) via a0,a1,a2
#
# print "We plot the data in each section with the corresponding"
# print "function values."
#
# splot f(x,y,-3), 'fit3.dat' in 0 u 1:2:4

Numo.gnuplot do
  run "f(x,y,t)=a0*t/(1+a1*x**2+a2*y**2)"
  fit 'f(x,y,t)', 'fit3.dat', u:'1:2:3:4:(1)', via:'a0,a1,a2'
  splot "f(x,y,-3)",
    ["'fit3.dat'", in:0, u:[1,2,4]]
end
```
![104fit/028](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/028.png)

### 29

```ruby
# splot f(x,y,-1), 'fit3.dat' in 1 u 1:2:4

Numo.gnuplot do
  splot "f(x,y,-1)",
    ["'fit3.dat'", in:1, u:[1,2,4]]
end
```
![104fit/029](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/029.png)

### 30

```ruby
# splot f(x,y,1), 'fit3.dat' in 2 u 1:2:4

Numo.gnuplot do
  splot "f(x,y,1)",
    ["'fit3.dat'", in:2, u:[1,2,4]]
end
```
![104fit/030](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/030.png)

### 31

```ruby
# splot f(x,y,3), 'fit3.dat' in 3 u 1:2:4

Numo.gnuplot do
  splot "f(x,y,3)",
    ["'fit3.dat'", in:3, u:[1,2,4]]
end
```
![104fit/031](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/031.png)

### 32

```ruby
# splot f(x,y,3),  'fit3.dat' in 3 u 1:2:4, \
#       f(x,y,1),  'fit3.dat' in 2 u 1:2:4, \
#       f(x,y,-1), 'fit3.dat' in 1 u 1:2:4, \
#       f(x,y,-3), 'fit3.dat' in 0 u 1:2:4

Numo.gnuplot do
  splot "f(x,y,3)",
    ["'fit3.dat'", in:3, u:[1,2,4]],
    "f(x,y,1)",
    ["'fit3.dat'", in:2, u:[1,2,4]],
    "f(x,y,-1)",
    ["'fit3.dat'", in:1, u:[1,2,4]],
    "f(x,y,-3)",
    ["'fit3.dat'", in:0, u:[1,2,4]]
end
```
![104fit/032](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/104fit/image/032.png)
