## time/date coords
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/timedat.html)

### 1

```ruby
# set title "Fsteps plot\nwith date and time as x-values"
# set style data fsteps
# set xlabel "Date\nTime"
# set timefmt "%d/%m/%y\t%H%M"
# set yrange [ 0 : ]
# set xdata time
# set xrange [ "1/6/93":"1/11/93" ]
# set ylabel "Concentration\nmg/l"
# set format x "%d/%m\n%H:%M"
# set grid
# set key left
# plot 'timedat.dat' using 1:3 t '', \
#      'timedat.dat' using 1:3 t 'Total P' with points, \
#      'timedat.dat' using 1:4 t '', \
#      'timedat.dat' using 1:4 t 'PO4' with points 

Numo.gnuplot do
  set title:"Fsteps plot\nwith date and time as x-values"
  set :style, :data, :fsteps
  set xlabel:"Date\nTime"
  set timefmt:"%d/%m/%y\t%H%M"
  set yrange:"[0:]"
  set :xdata, :time
  set xrange:"[\"1/6/93\":\"1/11/93\"]"
  set ylabel:"Concentration\nmg/l"
  set format_x:"%d/%m\n%H:%M"
  set :grid
  set :key, :left
  plot ["'timedat.dat'", using:[1,3], t:''],
    ["'timedat.dat'", using:[1,3], t:'Total P', with:"points"],
    ["'timedat.dat'", using:[1,4], t:''],
    ["'timedat.dat'", using:[1,4], t:'PO4', with:"points"]
end
```
![304timedat/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/304timedat/image/001.png)

### 2

```ruby
# reset
# 
# set title "Time data on Y, millisecond precision" font ",14"
# set ydata time
# set timefmt "%s"
# set offset 0.5,1.5,.2,.2
# unset key
# 
# fulltime(col) = strftime("%d %b %Y\n%H:%M:%.3S",column(col))
# parttime(col) = strftime("%H:%M:%.3S",column(col))
# 
# plot '-' using 0:1:(fulltime(1)):xticlabels(2):yticlabels(parttime(1)) \
#          with labels point pt 7 left offset 1,1 font ",7"
# 1390852607.1	A
# 1390852607.2	B
# 1390852607.4	C
# 1390852607.8	D
# 1390852608.4	E
# 1390852610.001	F
# e
# 
# reset

Numo.gnuplot do
  reset
  set title:"Time data on Y, millisecond precision", font:",14"
  set :ydata, :time
  set timefmt:"%s"
  set offset:[0.5,1.5,0.2,0.2]
  unset :key
  run "fulltime(col) = strftime(\"%d %b %Y\\n%H:%M:%.3S\",column(col))"
  run "parttime(col) = strftime(\"%H:%M:%.3S\",column(col))"
  run <<EOL
plot '-' using 0:1:(fulltime(1)):xticlabels(2):yticlabels(parttime(1))           with labels point pt 7 left offset 1,1 font ",7"
1390852607.1	A
1390852607.2	B
1390852607.4	C
1390852607.8	D
1390852608.4	E
1390852610.001	F
e
EOL
  reset
end
```
![304timedat/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/304timedat/image/002.png)
