## data statistics
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/stats.html)

### 1

```ruby
# # Exercise the "stats" command.
# # Skip this demo cleanly if the stats option was not configured.
# #
# if (!strstrt(GPVAL_COMPILE_OPTIONS,"+STATS")) {
#     print "No support for stats command"
# } else {
#
# set title "Use of stats command to find min/max/mean before plotting\nOne data column"
#
# set style data line
# set offset 0,0,.5,.5
# set autoscale fix
# set key left Left
#
# stats 'orbital_elements.dat' index 1 using 2 prefix "A"
#
# set arrow 1 from A_index_min, graph 0.1 to A_index_min, A_min fill
# set arrow 2 from A_index_max, graph 0.9 to A_index_max, A_max fill
# set label 1 "min" at A_index_min, graph 0.1 center offset 0,-1
# set label 2 "max" at A_index_max, graph 0.9 center offset 0,1
#
# plot 'orbital_elements.dat' index 1 using 0:2 title "  Data" lw 2, \
#      A_mean title "  Mean"

Numo.gnuplot do
  set title:"Use of stats command to find min/max/mean before plotting\nOne data column"
  set :style, :data, :line
  set offset:[0,0,0.5,0.5]
  set autoscale:"fix"
  set :key, :left, :Left
  stats 'orbital_elements.dat', index:1, using:2, prefix:"A"
  set :arrow, 1, from:"A_index_min, graph 0.1", to:"A_index_min, A_min", fill:true
  set :arrow, 2, from:"A_index_max, graph 0.9", to:"A_index_max, A_max", fill:true
  set :label, 1, "min", at:"A_index_min, graph 0.1", center:true, offset:[0,-1]
  set :label, 2, "max", at:"A_index_max, graph 0.9", center:true, offset:[0,1]
  plot ["'orbital_elements.dat'", index:1, using:[0,2], title:"  Data", lw:2],
    ["A_mean", title:"  Mean"]
end
```
![109stats/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/109stats/image/001.png)

### 2

```ruby
# set title "Use of stats command to find min/max/mean before plotting\nTwo data columns"
#
# f(x) = log(1+x)
#
# stats 'orbital_elements.dat' index 1 using (f($0)):2 prefix "B"
#
# set arrow 1 from B_pos_min_y, graph 0.1 to B_pos_min_y, B_min_y fill
# set arrow 2 from B_pos_max_y, graph 0.9 to B_pos_max_y, B_max_y fill
# set label 1 "min" at B_pos_min_y, graph 0.1 center offset 0,-1
# set label 2 "max" at B_pos_max_y, graph 0.9 center offset 0,1
#
# plot 'orbital_elements.dat' index 1 using (f($0)):2 title "  Data" lw 2, \
#      B_mean_y title "  Mean", \
#      B_slope * x + B_intercept title "Linear fit"

Numo.gnuplot do
  set title:"Use of stats command to find min/max/mean before plotting\nTwo data columns"
  run "f(x) = log(1+x)"
  stats 'orbital_elements.dat', index:1, using:'(f($0)):2', prefix:"B"
  set :arrow, 1, from:"B_pos_min_y, graph 0.1", to:"B_pos_min_y, B_min_y", fill:true
  set :arrow, 2, from:"B_pos_max_y, graph 0.9", to:"B_pos_max_y, B_max_y", fill:true
  set :label, 1, "min", at:"B_pos_min_y, graph 0.1", center:true, offset:[0,-1]
  set :label, 2, "max", at:"B_pos_max_y, graph 0.9", center:true, offset:[0,1]
  plot ["'orbital_elements.dat'", index:1, using:'(f($0)):2', title:"  Data", lw:2],
    ["B_mean_y", title:"  Mean"],
    ["B_slope *", 'x+B_intercept', title:"Linear fit"]
end
```
![109stats/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/109stats/image/002.png)
