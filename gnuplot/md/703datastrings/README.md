## string data
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/datastrings.html)

### 1

```ruby
# # Demonstrate features of datastrings patch
# # Ethan A Merritt <merritt@u.washington.edu>
# # 08-Mar-2003
# #
# reset
# #
# # Illustrate reading plot labels from column head in datafile
# #
# set title "Auto-labeling plots from text fields in datafile"
# set label 1 "Generate plot labels from first row in each column"
# set label 1 at graph 0.02, 0.85 tc lt 3
# set label 2 "Generate x-axis labels from first column in each row"
# set label 2 at graph 0.02, 0.80 tc lt 3
# set style data linespoints
# set ylabel "mm"
# set yrange [0:200]
# #
# set key autotitle columnhead
# plot 'ctg-y2.dat' using 2:xticlabel(1) index 2, \
#      ''           using 2 index 3

Numo.gnuplot do
  reset
  set title:"Auto-labeling plots from text fields in datafile"
  set :label, 1, "Generate plot labels from first row in each column"
  set :label, 1, at_graph:[0.02,0.85], tc_lt:3
  set :label, 2, "Generate x-axis labels from first column in each row"
  set :label, 2, at_graph:[0.02,0.80], tc_lt:3
  set :style, :data, :linespoints
  set ylabel:"mm"
  set yrange:0..200
  set :key, autotitle:"columnhead"
  plot ["'ctg-y2.dat'", using:'2:xticlabel(1)', index:2],
    ["''", using:2, index:3]
end
```
![703datastrings/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/001.png)

### 2

```ruby
# # Illustrate reading xtic axis labels from the datafile
# #
# reset
# set title "Read tic labels from a datafile column\nAn approximation of Hans Olav Eggestad's categoric plot patch\nusing 'using ($0):2:xticlabels(1)' and 'set style fill solid border -1'"
# set boxwidth 0.3
# set style fill solid 1.000000 border -1
# set bmargin 3
# set pointsize 2
# set yrange [0:180]
# set xrange [-0.5:11.5]
# set ylabel "mm"
# set tics scale 0.0
# set grid y
# set xtics
# #
# set key autotitle columnhead
# plot 'ctg-y2.dat' using ($0-0.2):2 index 0 with boxes title "precipitation 1992-2000", \
#      ''           using ($0+0.2):2 index 1 with boxes title "              2000-2001", \
#      ''           using ($0):2 index 2 with linespoints lw 3 title "runoff 1992-2000", \
#      ''           using ($0):2:xticlabels(1) index 3 with linespoints lw 3 title "       2000-2001"

Numo.gnuplot do
  reset
  set title:"Read tic labels from a datafile column\nAn approximation of Hans Olav Eggestad's categoric plot patch\nusing 'using ($0):2:xticlabels(1)' and 'set style fill solid border -1'"
  set boxwidth:0.3
  set :style, fill_solid:1.000000, border:-1
  set bmargin:3
  set pointsize:2
  set yrange:0..180
  set xrange:-0.5..11.5
  set ylabel:"mm"
  set :tics, :scale, 0.0
  set grid:"y"
  set :xtics
  set :key, autotitle:"columnhead"
  plot ["'ctg-y2.dat'", using:'($0-0.2):2', index:0, with:"boxes", title:"precipitation 1992-2000"],
    ["''", using:'($0+0.2):2', index:1, with:"boxes", title:"              2000-2001"],
    ["''", using:'($0):2', index:2, with:"linespoints", lw:3, title:"runoff 1992-2000"],
    ["''", using:'($0):2:xticlabels(1)', index:3, with:"linespoints", lw:3, title:"       2000-2001"]
end
```
![703datastrings/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/002.png)

### 3

```ruby
# set title "Same plot using x2ticlabels also"
# set x2tics
# plot 'ctg-y2.dat' using ($0-0.2):2 index 0 with boxes title "precipitation 1992-2000", \
#      ''           using ($0+0.2):2 index 1 with boxes title "              2000-2001", \
#      ''           using ($0):2 index 2 with linespoints lw 3 title "runoff 1992-2000", \
#      ''           using ($0):2:x2ticlabels(1) index 3 with linespoints lw 3 title "       2000-2001"

Numo.gnuplot do
  set title:"Same plot using x2ticlabels also"
  set :x2tics
  plot ["'ctg-y2.dat'", using:'($0-0.2):2', index:0, with:"boxes", title:"precipitation 1992-2000"],
    ["''", using:'($0+0.2):2', index:1, with:"boxes", title:"              2000-2001"],
    ["''", using:'($0):2', index:2, with:"linespoints", lw:3, title:"runoff 1992-2000"],
    ["''", using:'($0):2:x2ticlabels(1)', index:3, with:"linespoints", lw:3, title:"       2000-2001"]
end
```
![703datastrings/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/003.png)

### 4

```ruby
# set title "Plot from table format (titles taken from column headers)"
# unset x2tics
# plot 'table.dat' using ($0-0.2):2 title column(2) with boxes, \
#      ''          using ($0+0.2):3 title column(3) with boxes, \
#      ''          using ($0):4     title column(4) with linespoints, \
#      ''          using ($0):5:xtic(1) title column(5) with linespoints

Numo.gnuplot do
  set title:"Plot from table format (titles taken from column headers)"
  unset :x2tics
  plot ["'table.dat'", using:'($0-0.2):2', title_nq:'column(2)', with:"boxes"],
    ["''", using:'($0+0.2):3', title_nq:'column(3)', with:"boxes"],
    ["''", using:'($0):4', title_nq:'column(4)', with:"linespoints"],
    ["''", using:'($0):5:xtic(1)', title_nq:'column(5)', with:"linespoints"]
end
```
![703datastrings/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/004.png)

### 5

```ruby
# set title "Plot actual y-value as a label"
# plot 'table.dat' using 0:2:xtic(1) title columnhead with boxes, \
#      ''          using 0:2:2 with labels center offset 0,1 notitle

Numo.gnuplot do
  set title:"Plot actual y-value as a label"
  plot ["'table.dat'", using:'0:2:xtic(1)', title_nq:'columnhead', with:"boxes"],
    ["''", using:[0,2,2], with:"labels", center:true, offset:0],
    ["1", :notitle]
end
```
![703datastrings/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/005.png)

### 6

```ruby
# # Now show the plot with labels options
# #
# reset
#
# set title "Read labels from a datafile column\nHere the 'plot with labels' command generates a\nC-alpha trace of retro-GCN4 peptide"
# set size square
# unset xtics
# unset ytics
# set border 3
# set xlabel "X--->"
# set ylabel "Z--->"
# set key bottom right
# #
# plot 'labelplot.pdb' using 7:9 with lines notitle, \
#       '' using 7:9:4 with labels tc lt 3 font "Helvetica,10" notitle

Numo.gnuplot do
  reset
  set title:"Read labels from a datafile column\nHere the 'plot with labels' command generates a\nC-alpha trace of retro-GCN4 peptide"
  set size:"square"
  unset :xtics
  unset :ytics
  set border:3
  set xlabel:"X--->"
  set ylabel:"Z--->"
  set :key, :bottom, :right
  plot ["'labelplot.pdb'", using:[7,9], with:"lines", notitle:true],
    ["''", using:[7,9,4], with:"labels", tc_lt:3, font:"Helvetica,10", notitle:true]
end
```
![703datastrings/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/006.png)

### 7

```ruby
# #     '' using 7:9 with points notitle ps 5 lt -1
# #
# reset
#
# set title "3D version generated by splot\n(sorry, the axis scales are distorted)"
# set zrange [-15:15]
#
# set view 70,210, 1.0,1.7
# set ticslevel 0.0
#
# splot 'labelplot.pdb' using 7:8:9 with lines notitle, \
#       '' using 7:8:9:4 with labels left offset 1,0 point \
# 	   ps 2 pt 1 tc lt 3 font "Helvetica,10" notitle

Numo.gnuplot do
  reset
  set title:"3D version generated by splot\n(sorry, the axis scales are distorted)"
  set zrange:-15..15
  set view:[70,210,1.0,1.7]
  set ticslevel:0.0
  splot ["'labelplot.pdb'", using:[7,8,9], with:"lines", notitle:true],
    ["''", using:[7,8,9,4], with:"labels", left:true, offset:1],
    ["0", point_ps:2, pt:1, tc_lt:3, font:"Helvetica,10", notitle:true]
end
```
![703datastrings/007](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/703datastrings/image/007.png)
