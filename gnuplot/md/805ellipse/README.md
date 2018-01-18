## axis location
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/ellipse.html)

### 1

```ruby
# # Ethan A Merritt - Feb 2007
# # This demo requires support for 'set object ellipse'
# # Also it uses the file 'random.tmp' created by random.dem
# #
# if ((GPVAL_VERSION == 4.3 || GPVAL_VERSION == 4.2) \
# &&  (!strstrt(GPVAL_COMPILE_OPTIONS,"+OBJECTS"))) \
#     print ">>> Skipping demo <<<\n" ; \
#     print "This copy of gnuplot was built without support for placing ellipses\n" ; \
#     exit ;
#
# unset key
# set xrange [-8:8]
# set yrange [-8:8]
# set size ratio 1.0
# set zeroaxis
# set border 0
# set xtics axis
# set ytics axis
# set tics scale 0.5
# set format xy ""
#
# set title 'Example of `set object ellipse`'
#
# set object 1 ellipse center 1.5,1.0 size 2.,4. angle 20. front fillstyle empty border -1
# set obj 2 ellipse center 1.5, 1  size 6, 12  angle 20 front fs empty bo 3
#
# A = pi/9.
# plot 'random.tmp' using (1.5 + $1*cos(A)-2.*$2*sin(A)):(1.0 + $1*sin(A)+2.*$2*cos(A)) with dots

Numo.gnuplot do
  unset :key
  set xrange:-8..8
  set yrange:-8..8
  set :size, :ratio, 1.0
  set :zeroaxis
  set border:0
  set :xtics, :axis
  set :ytics, :axis
  set :tics, :scale, 0.5
  set format_xy:""
  set title:'Example of `set object ellipse`'
  set :object, 1, :ellipse, center:[1.5,1.0], size:[2.0,4.0], angle:20.0, front:true, fillstyle:true, empty:true, border:-1
  set :obj, 2, :ellipse, center:[1.5,1], size:[6,12], angle:20, front:true, fs:true, empty:true, bo:3
  run "A = pi/9."
  plot "'random.tmp'", using:'(1.5 + $1*cos(A)-2.*$2*sin(A)):(1.0 + $1*sin(A)+2.*$2*cos(A))', with:"dots"
end
```
![805ellipse/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/805ellipse/image/001.png)

### 2

```ruby
# set title 'Example of range-limited axes and tics'
#
# set tics out scale 0.5
# set xtics 1.0 border rangelimited nomirror
# set ytics 1.0 border rangelimited nomirror
# set format xy "%.0f"
# set border 3
#
# replot

Numo.gnuplot do
  set title:'Example of range-limited axes and tics'
  set :tics, :out, scale:0.5
  set xtics:1.0, border:"rangelimited", nomirror:true
  set ytics:1.0, border:"rangelimited", nomirror:true
  set format_xy:"%.0f"
  set border:3
  replot
end
```
![805ellipse/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/805ellipse/image/002.png)
