## string variables
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/stringvar.html)

### 1

```ruby
# # Miscellaneous neat things you can do using the string variables code
# #
# set print "stringvar.tmp"
# print ""
# print "Exercise substring handling"
# print ""
# beg = 2
# end = 4
# print "beg = ",beg," end = ",end
# foo = "ABCDEF"
# print "foo           = ",foo
# print "foo[3:5]      = ",foo[3:5]
# print "foo[1:1]      = ",foo[1:1]
# print "foo[5:3]      = ",foo[5:3]
# print "foo[beg:end]  = ",foo[beg:end]
# print "foo[end:beg]  = ",foo[end:beg]
# print "foo[5:]       = ",foo[5:]
# print "foo[5:*]      = ",foo[5:*]
# print "foo[:]        = ",foo[:]
# print "foo[*:*]      = ",foo[*:*]
# print "foo.foo[2:2]  = ",foo.foo[2:2]
# print "(foo.foo)[2:2]= ",(foo.foo)[2:2]
# print ""
# unset print
# 
# set label 1 system("cat stringvar.tmp") at graph 0.1, graph 0.9
# unset xtics
# unset ytics
# set yrange [0:1]
# plot 0

Numo.gnuplot do
  run <<EOL
set print "stringvar.tmp"
print ""
print "Exercise substring handling"
print ""
beg = 2
end = 4
print "beg = ",beg," end = ",end
foo = "ABCDEF"
print "foo           = ",foo
print "foo[3:5]      = ",foo[3:5]
print "foo[1:1]      = ",foo[1:1]
print "foo[5:3]      = ",foo[5:3]
print "foo[beg:end]  = ",foo[beg:end]
print "foo[end:beg]  = ",foo[end:beg]
print "foo[5:]       = ",foo[5:]
print "foo[5:*]      = ",foo[5:*]
print "foo[:]        = ",foo[:]
print "foo[*:*]      = ",foo[*:*]
print "foo.foo[2:2]  = ",foo.foo[2:2]
print "(foo.foo)[2:2]= ",(foo.foo)[2:2]
print ""
unset print
EOL
  set :label, 1, :'system("cat stringvar.tmp")', at:"graph 0.1, graph 0.9"
  unset :xtics
  unset :ytics
  set yrange:0..1
  plot "0"
end
```
![705stringvar/001](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/001.png)

### 2

```ruby
# set print "stringvar.tmp"
# print "Exercise string handling functions"
# print ""
# print "foo          = ",foo
# print "strlen(foo)  = ",strlen(foo)
# print "substr(foo,3,4) = ",substr(foo,3,4)
# print ""
# haystack = "`date`"
# needle = ":"
# S = strstrt(haystack,needle)
# print "haystack     = \`date\`"
# print "haystack     = ",haystack
# print "needle       = ",needle
# print "S = strstrt(haystack,needle) = ",S
# print "haystack[S-2:S+2] = ",haystack[S-2:S+2]
# print "It is now " . haystack[S-2:S+2]
# #
# print ""
# print "words(haystack)   = ",words(haystack)
# print "word(haystack,5)  = ",word(haystack,5)
# #
# print ""
# #
# foo = sprintf("%40d %40d %40d %40d %40d %40d",1,2,3,4,5,6)
# if (strlen(foo) == 245) print "sprintf output of long strings works OK"
# if (strlen(foo) != 245) print "sprintf output of long strings BROKEN"
# print ""
# 
# unset print
# set label 1 system("cat stringvar.tmp") at graph 0.1, graph 0.9
# unset xtics
# unset ytics
# set yrange [0:1]
# plot 0

Numo.gnuplot do
  run <<EOL
set print "stringvar.tmp"
print "Exercise string handling functions"
print ""
print "foo          = ",foo
print "strlen(foo)  = ",strlen(foo)
print "substr(foo,3,4) = ",substr(foo,3,4)
print ""
haystack = "`date`"
needle = ":"
S = strstrt(haystack,needle)
print "haystack     = \`date\`"
print "haystack     = ",haystack
print "needle       = ",needle
print "S = strstrt(haystack,needle) = ",S
print "haystack[S-2:S+2] = ",haystack[S-2:S+2]
print "It is now " . haystack[S-2:S+2]
print ""
print "words(haystack)   = ",words(haystack)
print "word(haystack,5)  = ",word(haystack,5)
print ""
foo = sprintf("%40d %40d %40d %40d %40d %40d",1,2,3,4,5,6)
if (strlen(foo) == 245) print "sprintf output of long strings works OK"
if (strlen(foo) != 245) print "sprintf output of long strings BROKEN"
print ""
unset print
EOL
  set :label, 1, :'system("cat stringvar.tmp")', at:"graph 0.1, graph 0.9"
  unset :xtics
  unset :ytics
  set yrange:0..1
  plot "0"
end
```
![705stringvar/002](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/002.png)

### 3

```ruby
# reset
# #
# set xrange [300:400]
# set title "String-valued expression in using spec"
# plot 'silver.dat' using 1:2 with linespoints notitle, \
#      '' using 1:2:(sprintf("[%.0f,%.0f]",$1,$2)) with labels

Numo.gnuplot do
  reset
  set xrange:300..400
  set title:"String-valued expression in using spec"
  plot ["'silver.dat'", using:[1,2], with:"linespoints", notitle:true],
    ["''", using:'1:2:(sprintf("[%.0f,%.0f]",$1,$2))', with:"labels"]
end
```
![705stringvar/003](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/003.png)

### 4

```ruby
# set xrange [0:1]
# set yrange [0:1]
# set title "Constant string expressions as plot symbols"
# set xrange [250:500]
# set auto y
# set style data lines
# plot 'silver.dat' u 1:2:($3+$1/50.) w filledcurves above title 'Above', \
#      '' u 1:2:($3+$1/50.) w filledcurves below title 'Below', \
#      '' u 1:2 lt -1 lw 0.5 notitle, \
#      '' u 1:($3+$1/50.) lt 3 lw 0.5 notitle, \
#      '' using 1:2:( ($2>($3+$1/50.)) ? "Up" : "Dn" ) with labels \
#         title 'plot <foo> using 1:2:( ($3>$2) ? "Up" : "Dn" ) with labels'

Numo.gnuplot do
  set xrange:0..1
  set yrange:0..1
  set title:"Constant string expressions as plot symbols"
  set xrange:250..500
  set auto:"y"
  set :style, :data, :lines
  plot ["'silver.dat'", u:'1:2:($3+$1/50.)', w:'filledcurves above', title:'Above'],
    ["''", u:'1:2:($3+$1/50.)', w:'filledcurves below', title:'Below'],
    ["''", u:[1,2], lt:-1, lw:0.5, notitle:true],
    ["''", u:'1:($3+$1/50.)', lt:3, lw:0.5, notitle:true],
    ["''", using:'1:2:( ($2>($3+$1/50.)) ? "Up" : "Dn" )', with:"labels", title:'plot <foo> using 1:2:( ($3>$2) ? "Up" : "Dn" ) with labels']
end
```
![705stringvar/004](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/004.png)

### 5

```ruby
# plot 'silver.dat' \
#         u 1:2 lt -1 lw 0.5 notitle, \
#      '' u 1:($3+$1/50.) lt 3 lw 0.5 notitle, \
#      '' using 1:2:( ($2>($3+$1/50.)) ? "J" : "D" ) with labels font "WingDings,28"\
#         title 'Same thing using character glyphs from WingDings font'

Numo.gnuplot do
  plot ["'silver.dat'", u:[1,2], lt:-1, lw:0.5, notitle:true],
    ["''", u:'1:($3+$1/50.)', lt:3, lw:0.5, notitle:true],
    ["''", using:'1:2:( ($2>($3+$1/50.)) ? "J" : "D" )', with:"labels", font:"WingDings,28", title:'Same thing using character glyphs from WingDings font']
end
```
![705stringvar/005](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/005.png)

### 6

```ruby
# reset
# set title "String-valued functions to generate datafile names"
# set key title 'file(i) = sprintf("%1d.dat",i); N=2; M=3'
# set key left width 25 Left reverse
# N = 2
# M = 3
# file(i) = sprintf("%1d.dat",i)
# plot 5*sin(x)/x, file(N), file(M)

Numo.gnuplot do
  reset
  set title:"String-valued functions to generate datafile names"
  set :key, title:'file(i) = sprintf("%1d.dat",i); N=2; M=3'
  set :key, :left, width:25, Left:true, reverse:true
  run "N = 2"
  run "M = 3"
  run "file(i) = sprintf(\"%1d.dat\",i)"
  plot "5*sin(x)/x",
    "file(N)",
    "file(M)"
end
```
![705stringvar/006](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/006.png)

### 7

```ruby
# reset
# fmt = '%Y-%m-%d %H:%M:%S'
# time_str = '2005-05-09 19:44:12'
# seconds = strptime(fmt, time_str)
# time_str2 = strftime(fmt, seconds+10.)
# print ''
# print 'time_str          = "', time_str, '"'
# print '-> seconds        = ', seconds
# print '   seconds + 10.  = ', seconds+10.
# print '-> time_str2      = "', time_str2, '"'
# #
# print ""
# #
# set xdata time
# set key inside left
# #set format x '%Y-%m-%d'
# fmt = "%d/%m/%y\t%H%M"
# print "read_time(fmt, c) =" \
#       . " strptime(fmt, stringcolumn(c).' '.stringcolumn(c+1))"
# read_time(fmt, c) = strptime(fmt, stringcolumn(c).' '.stringcolumn(c+1))
# plot 'timedat.dat' using (read_time(fmt,1)):3 with histeps, \
#      'timedat.dat' using (read_time(fmt,1)):($3-0.01):2 with labels title ''

Numo.gnuplot do
  reset
  run "fmt = '%Y-%m-%d %H:%M:%S'"
  run "time_str = '2005-05-09 19:44:12'"
  run "seconds = strptime(fmt, time_str)"
  run "time_str2 = strftime(fmt, seconds+10.)"
  set :xdata, :time
  set :key, :inside, :left
  run "fmt = \"%d/%m/%y\\t%H%M\""
  run "read_time(fmt, c) = strptime(fmt, stringcolumn(c).' '.stringcolumn(c+1))"
  plot ["'timedat.dat'", using:'(read_time(fmt,1)):3', with:"histeps"],
    ["'timedat.dat'", using:'(read_time(fmt,1)):($3-0.01):2', with:"labels", title:'']
end
```
![705stringvar/007](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/705stringvar/image/007.png)
