## mixing styles
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/using.html)

### 1

```ruby
# # Requires data file "using.dat" from this directory,
# # so change current working directory to this directory before running.
# #
#
# set title "Convex     November 1-7 1989    Circadian"
# set key left box
# set xrange[-1:24]
# plot 'using.dat' using 2:4 title "Logged in" with impulses,\
#      'using.dat' using 2:4 title "Logged in" with points

Numo.gnuplot do
  set title:"Convex     November 1-7 1989    Circadian"
  set :key, :left, :box
  set xrange:-1..24
  plot ["'using.dat'", using:[2,4], title:"Logged in", with:"impulses"],
    ["'using.dat'", using:[2,4], title:"Logged in", with:"points"]
end
```
![009using/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/009using/image/001.png)

### 2

```ruby
# set xrange [1:8]
# #set xdtic
# set title "Convex     November 1-7 1989"
# set key below
# set label "(Weekend)" at 5,25 center
# plot 'using.dat' using 3:4 title "Logged in" with impulses,\
#      'using.dat' using 3:5 t "Load average" with points,\
#      'using.dat' using 3:6 t "%CPU used" with lines

Numo.gnuplot do
  set xrange:1..8
  set title:"Convex     November 1-7 1989"
  set :key, "below"
  set label:"(Weekend)", at:[5,25], center:true
  plot ["'using.dat'", using:[3,4], title:"Logged in", with:"impulses"],
    ["'using.dat'", using:[3,5], t:"Load average", with:"points"],
    ["'using.dat'", using:[3,6], t:"%CPU used", with:"lines"]
end
```
![009using/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/009using/image/002.png)
