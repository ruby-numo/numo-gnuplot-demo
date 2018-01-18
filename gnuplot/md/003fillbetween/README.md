## fill between curves
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/fillbetween.html)

### 1

```ruby
# # Demonstrate filling the area between two curves
# # and also the application of fillstyle to filled curves.
# # Ethan Merritt  <merritt@u.washington.edu>
# # June 2004
# #
# set title "Fill area between two curves"
# set style data lines
# set xrange [10:*]
# set yrange [0:175]
# plot 'silver.dat' u 1:2:3 w filledcu, \
#       '' u 1:2 lt -1 notitle, '' u 1:3 lt -1 notitle

Numo.gnuplot do
  set title:"Fill area between two curves"
  set :style, :data, :lines
  set xrange:"[10:*]"
  set yrange:0..175
  plot ["'silver.dat'", u:[1,2,3], w:"filledcu"],
    ["''", u:[1,2], lt:-1, notitle:true],
    ["''", u:[1,3], lt:-1, notitle:true]
end
```
![003fillbetween/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/003fillbetween/image/001.png)

### 2

```ruby
# set style fill pattern 2
# set title "Fill area between two curves (pattern fill)"
# replot

Numo.gnuplot do
  set :style, :fill, pattern:2
  set title:"Fill area between two curves (pattern fill)"
  replot
end
```
![003fillbetween/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/003fillbetween/image/002.png)

### 3

```ruby
# set title "Fill area between two curves (above/below)"
# set style fill solid 1.0 noborder
# set xrange [250:500]
# set auto y
# plot 'silver.dat' u 1:2:($3+$1/50.) w filledcurves above title 'Above', \
#                '' u 1:2:($3+$1/50.) w filledcurves below title 'Below', \
# 	       '' u 1:2 lt -1 lw 2 title 'curve 1', \
# 	       '' u 1:($3+$1/50.) lt 3 lw 2 title 'curve 2'

Numo.gnuplot do
  set title:"Fill area between two curves (above/below)"
  set :style, fill_solid:1.0, noborder:true
  set xrange:250..500
  set auto:"y"
  plot ["'silver.dat'", u:'1:2:($3+$1/50.)', w:'filledcurves above', title:'Above'],
    ["''", u:'1:2:($3+$1/50.)', w:'filledcurves below', title:'Below'],
    ["''", u:[1,2], lt:-1, lw:2, title:'curve 1'],
    ["''", u:'1:($3+$1/50.)', lt:3, lw:2, title:'curve 2']
end
```
![003fillbetween/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/003fillbetween/image/003.png)
