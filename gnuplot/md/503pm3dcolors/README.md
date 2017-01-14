## pm3d colors
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/pm3dcolors.html)

### 1

```ruby
# # Test of color modes for pm3d palettes.
# 
# #
# # Multiplot with some of the recommended rgbformulae palettes
# #
# set pm3d map
# set multiplot layout 3,3 \
#     title "Palettes according to 'help palette rgbformulae'"
# g(x)=x
# set xrange [0:1]; set xtics 0.2 scale 1.5 nomirror; set mxtics 2
# # set palette maxcolors 128
# unset colorbox; unset key; set tics out; unset ytics
# set palette rgb 7,5,15; set title "traditional pm3d\n(black-blue-red-yellow)"; splot g(x)
# set palette rgb 3,11,6; set title "green-red-violet"; splot g(x)
# set palette rgb 23,28,3; set title "ocean (green-blue-white)\ntry also other permutations"; splot g(x)
# set palette rgb 21,22,23; set title "hot (black-red-yellow-white)"; splot g(x)
# set palette rgb 30,31,32; set title "color printable on gray\n(black-blue-violet-yellow-white)"; splot g(x)
# set palette rgb 33,13,10; set title "rainbow (blue-green-yellow-red)"; splot g(x)
# set palette rgb 34,35,36; set title "AFM hot (black-red-yellow-white)"; splot g(x)
# set palette model HSV
# set palette rgb 3,2,2; set title "HSV model\n(red-yellow-green-cyan-blue-magenta-red)"; splot g(x)
# set pal gray; set title "gray palette"; splot g(x)
# unset multiplot

Numo.gnuplot do
  set :pm3d, :map
  set :multiplot, layout:[3,3], title:"Palettes according to 'help palette rgbformulae'"
  run "g(x)=x"
  set xrange:0..1; set xtics:0.2, scale:1.5, nomirror:true; set mxtics:2
  unset :colorbox; unset :key; set :tics, :out; unset :ytics
  set :palette, rgb:[7,5,15]; set title:"traditional pm3d\n(black-blue-red-yellow)"; splot "g(x)"
  set :palette, rgb:[3,11,6]; set title:"green-red-violet"; splot "g(x)"
  set :palette, rgb:[23,28,3]; set title:"ocean (green-blue-white)\ntry also other permutations"; splot "g(x)"
  set :palette, rgb:[21,22,23]; set title:"hot (black-red-yellow-white)"; splot "g(x)"
  set :palette, rgb:[30,31,32]; set title:"color printable on gray\n(black-blue-violet-yellow-white)"; splot "g(x)"
  set :palette, rgb:[33,13,10]; set title:"rainbow (blue-green-yellow-red)"; splot "g(x)"
  set :palette, rgb:[34,35,36]; set title:"AFM hot (black-red-yellow-white)"; splot "g(x)"
  set :palette, model:"HSV"
  set :palette, rgb:[3,2,2]; set title:"HSV model\n(red-yellow-green-cyan-blue-magenta-red)"; splot "g(x)"
  set :pal, "gray"; set title:"gray palette"; splot "g(x)"
  unset :multiplot
end
```
![503pm3dcolors/001](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/001.png)

### 2

```ruby
# reset
# 
# #
# #   Gradient Palettes
# #
# set pm3d map
# set palette color
# 
# f(x)=(x+10)/20
# set cbrange [f(-10):f(10)] # [0:1]
# set xrange [-10:10]
# set yrange [*:*]
# set xtics 2
# set cbtics 0.1
# set format cb "%3.1f"
# unset ztics
# unset ytics
# set samples 101
# set isosamples 2
# unset key
# 
# set palette model RGB
# 
# set palette defined 
# set title "set palette defined"
# splot f(x)

Numo.gnuplot do
  reset
  set :pm3d, :map
  set :palette, :color
  run "f(x)=(x+10)/20"
  set cbrange:"[f(-10):f(10)]" # [0:1]
  set xrange:-10..10
  set yrange:"[*:*]"
  set xtics:2
  set cbtics:0.1
  set format_cb:"%3.1f"
  unset :ztics
  unset :ytics
  set samples:101
  set isosamples:2
  unset :key
  set :palette, model:"RGB"
  set :palette, :defined
  set title:"set palette defined"
  splot "f(x)"
end
```
![503pm3dcolors/002](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/002.png)

### 3

```ruby
# set palette defined (0 0 0 0, 1 0 0 1, 3 0 1 0, 4 1 0 0, 6 1 1 1)
# set title 'set palette defined (0 0 0 0, 1 0 0 1, 3 0 1 0, 4 1 0 0, 6 1 1 1)'
# splot f(x)

Numo.gnuplot do
  set :palette, defined:'(0 0 0 0, 1 0 0 1, 3 0 1 0, 4 1 0 0, 6 1 1 1)'
  set title:'set palette defined (0 0 0 0, 1 0 0 1, 3 0 1 0, 4 1 0 0, 6 1 1 1)'
  splot "f(x)"
end
```
![503pm3dcolors/003](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/003.png)

### 4

```ruby
# set palette defined ( 0 "green", 1 "blue", 2 "red", 3 "orange" ) 
# set title 'set palette defined ( 0 "green", 1 "blue", 2 "red", 3 "orange" )'
# splot f(x)

Numo.gnuplot do
  set :palette, defined:'( 0 "green", 1 "blue", 2 "red", 3 "orange" )'
  set title:'set palette defined ( 0 "green", 1 "blue", 2 "red", 3 "orange" )'
  splot "f(x)"
end
```
![503pm3dcolors/004](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/004.png)

### 5

```ruby
# set palette defined ( 20 "#101010", 30 "#ff0000", 40 "#00ff00", 50 "#e0e0e0" ) 
# set title 'set palette defined ( 20 "#101010", 30 "#ff0000", 40 "#00ff00", 50 "#e0e0e0" )'
# splot f(x)

Numo.gnuplot do
  set :palette, defined:'( 20 "#101010", 30 "#ff0000", 40 "#00ff00", 50 "#e0e0e0" )'
  set title:'set palette defined ( 20 "#101010", 30 "#ff0000", 40 "#00ff00", 50 "#e0e0e0" )'
  splot "f(x)"
end
```
![503pm3dcolors/005](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/005.png)

### 6

```ruby
# set palette defined ( 0 0 0 0, 1 1 1 1 )
# set title 'set palette defined ( 0 0 0 0, 1 1 1 1 )'
# splot f(x)

Numo.gnuplot do
  set :palette, defined:'( 0 0 0 0, 1 1 1 1 )'
  set title:'set palette defined ( 0 0 0 0, 1 1 1 1 )'
  splot "f(x)"
end
```
![503pm3dcolors/006](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/006.png)

### 7

```ruby
# set palette model HSV defined ( 0 0 1 1, 1 1 1 1 )
# set title 'set palette model HSV defined ( 0 0 1 1, 1 1 1 1 )'
# splot f(x)

Numo.gnuplot do
  set :palette, model:"HSV", defined:'( 0 0 1 1, 1 1 1 1 )'
  set title:'set palette model HSV defined ( 0 0 1 1, 1 1 1 1 )'
  splot "f(x)"
end
```
![503pm3dcolors/007](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/007.png)

### 8

```ruby
# set palette model RGB
# set palette model RGB defined (0 "green", 1 "dark-green", 1 "yellow", 2 "dark-yellow", 2 "red", 3 "dark-red" )
# set title "set palette model RGB defined\n(0 'green', 1 'dark-green', 1 'yellow', 2 'dark-yellow', 2 'red', 3 'dark-red' )"
# splot f(x)

Numo.gnuplot do
  set :palette, model:"RGB"
  set :palette, model:"RGB", defined:'(0 "green", 1 "dark-green", 1 "yellow", 2 "dark-yellow", 2 "red", 3 "dark-red" )'
  set title:"set palette model RGB defined\n(0 'green', 1 'dark-green', 1 'yellow', 2 'dark-yellow', 2 'red', 3 'dark-red' )"
  splot "f(x)"
end
```
![503pm3dcolors/008](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/008.png)

### 9

```ruby
# set palette model RGB
# 
# set title 'set palette file "-" (file with 3 columns)'
# set palette file "-"
# 0 0 0
# 0 0 1
# 0 1 0
# 1 0 0
# 1 1 1
# e
# splot f(x)

Numo.gnuplot do
  set :palette, model:"RGB"
  run <<EOL
set title 'set palette file "-" (file with 3 columns)'
set palette file "-"
0 0 0
0 0 1
0 1 0
1 0 0
1 1 1
e
EOL
  splot "f(x)"
end
```
![503pm3dcolors/009](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/009.png)

### 10

```ruby
# set title 'set palette file "-" (file with 4 columns)'
# set palette file "-"
# 10 0 0 0
# 20 0 0 1
# 40 0 1 0
# 60 1 0 0
# 70 1 1 1
# e
# splot f(x)

Numo.gnuplot do
  run <<EOL
set title 'set palette file "-" (file with 4 columns)'
set palette file "-"
10 0 0 0
20 0 0 1
40 0 1 0
60 1 0 0
70 1 1 1
e
EOL
  splot "f(x)"
end
```
![503pm3dcolors/010](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/010.png)

### 11

```ruby
# set title 'set palette file "-" using 1:2:($1+$2)/2'
# set palette file "-" using ($0):1:2:(($1+$2)/2)
# 0 0
# 0 1
# 1 0
# 1 1
# e
# splot f(x)

Numo.gnuplot do
  run <<EOL
set title 'set palette file "-" using 1:2:($1+$2)/2'
set palette file "-" using ($0):1:2:(($1+$2)/2)
0 0
0 1
1 0
1 1
e
EOL
  splot "f(x)"
end
```
![503pm3dcolors/011](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/011.png)

### 12

```ruby
# #    Color Models
# #
# set palette color
# set pm3d map
# set xrange [-10:10]
# unset ztics
# unset ytics
# set samples 101
# set isosamples 2
# set xtics 2
# 
# set palette rgbformulae 7,5,15
# 
# set palette model RGB rgbformulae 7,5,15
# set title "set palette model RGB rgbformulae 7,5,15"
# splot f(x)

Numo.gnuplot do
  set :palette, :color
  set :pm3d, :map
  set xrange:-10..10
  unset :ztics
  unset :ytics
  set samples:101
  set isosamples:2
  set xtics:2
  set :palette, rgbformulae:[7,5,15]
  set :palette, model:"RGB", rgbformulae:[7,5,15]
  set title:"set palette model RGB rgbformulae 7,5,15"
  splot "f(x)"
end
```
![503pm3dcolors/012](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/012.png)

### 13

```ruby
# set palette model HSV rgbformulae 7,5,15
# set title "set palette model HSV rgbformulae 7,5,15"
# splot f(x)

Numo.gnuplot do
  set :palette, model:"HSV", rgbformulae:[7,5,15]
  set title:"set palette model HSV rgbformulae 7,5,15"
  splot "f(x)"
end
```
![503pm3dcolors/013](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/013.png)

### 14

```ruby
# set palette model XYZ rgbformulae 7,5,15
# set title "set palette model XYZ rgbformulae 7,5,15"
# splot f(x)

Numo.gnuplot do
  set :palette, model:"XYZ", rgbformulae:[7,5,15]
  set title:"set palette model XYZ rgbformulae 7,5,15"
  splot "f(x)"
end
```
![503pm3dcolors/014](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/014.png)

### 15

```ruby
# set palette model CMY rgbformulae 7,5,15
# set title "set palette model CMY rgbformulae 7,5,15"
# splot f(x)

Numo.gnuplot do
  set :palette, model:"CMY", rgbformulae:[7,5,15]
  set title:"set palette model CMY rgbformulae 7,5,15"
  splot "f(x)"
end
```
![503pm3dcolors/015](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/015.png)

### 16

```ruby
# set palette model YIQ rgbformulae 7,5,15
# set title "set palette model YIQ rgbformulae 7,5,15"
# splot f(x)

Numo.gnuplot do
  set :palette, model:"YIQ", rgbformulae:[7,5,15]
  set title:"set palette model YIQ rgbformulae 7,5,15"
  splot "f(x)"
end
```
![503pm3dcolors/016](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/016.png)

### 17

```ruby
# set palette model HSV rgbformulae 3,2,2
# set title "set palette model HSV rrgbformulae 3,2,2"
# splot f(x)

Numo.gnuplot do
  set :palette, model:"HSV", rgbformulae:[3,2,2]
  set title:"set palette model HSV rrgbformulae 3,2,2"
  splot "f(x)"
end
```
![503pm3dcolors/017](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/017.png)

### 18

```ruby
# #   User Defined Functions
# #
# set palette color
# set pm3d map
# set cbrange [f(-10):f(10)]
# set xrange [-10:10]
# set yrange [0:1]
# unset ztics
# unset ytics
# set samples 101
# set isosamples 2
# set xtics 2
# 
# set palette model RGB
# 
# set palette functions gray, gray, gray
# set title "set palette functions gray, gray, gray"
# splot f(x)

Numo.gnuplot do
  set :palette, :color
  set :pm3d, :map
  set cbrange:"[f(-10):f(10)]"
  set xrange:-10..10
  set yrange:0..1
  unset :ztics
  unset :ytics
  set samples:101
  set isosamples:2
  set xtics:2
  set :palette, model:"RGB"
  set :palette, functions:'gray,gray,gray'
  set title:"set palette functions gray, gray, gray"
  splot "f(x)"
end
```
![503pm3dcolors/018](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/018.png)

### 19

```ruby
# set palette functions sqrt(gray), gray**3, sin(gray*2*pi) 
# set title 'set palette functions sqrt(gray), gray**3, sin(gray*2*pi)  <--> 7,5,15'
# splot f(x)

Numo.gnuplot do
  set :palette, functions:'sqrt(gray),gray**3,sin(gray*2*pi)'
  set title:'set palette functions sqrt(gray), gray**3, sin(gray*2*pi)  <--> 7,5,15'
  splot "f(x)"
end
```
![503pm3dcolors/019](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/019.png)

### 20

```ruby
# set palette rgbformulae 7,5,15
# set title 'set palette rgbformulae 7,5,15'
# splot f(x)

Numo.gnuplot do
  set :palette, rgbformulae:[7,5,15]
  set title:'set palette rgbformulae 7,5,15'
  splot "f(x)"
end
```
![503pm3dcolors/020](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/020.png)

### 21

```ruby
# set palette model XYZ functions gray**0.35, gray**0.5, gray**0.8
# set title 'set palette model XYZ functions model XYZ  gray**0.35, gray**0.5, gray**0.8'
# splot f(x)

Numo.gnuplot do
  set :palette, model:"XYZ", functions:'gray**0.35,gray**0.5,gray**0.8'
  set title:'set palette model XYZ functions model XYZ  gray**0.35, gray**0.5, gray**0.8'
  splot "f(x)"
end
```
![503pm3dcolors/021](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/021.png)

### 22

```ruby
# theta(x) = x<0 ? 0 : 1
# r(x) = 4*x*(1-theta(x-0.25))
# g(x) = 0.5*theta(x-0.25)*(1-theta(x-0.5))
# b(x) = x
# set palette model RGB functions r(gray),g(gray),b(gray)
# set title "set palette model RGB functions\n4*x*(1-theta(x-0.25)), 0.5*theta(x-0.25)*(1-theta(x-0.5)), x"
# splot f(x)

Numo.gnuplot do
  run "theta(x) = x<0 ? 0 : 1"
  run "r(x) = 4*x*(1-theta(x-0.25))"
  run "g(x) = 0.5*theta(x-0.25)*(1-theta(x-0.5))"
  run "b(x) = x"
  set :palette, model:"RGB", functions:'r(gray),g(gray),b(gray)'
  set title:"set palette model RGB functions\n4*x*(1-theta(x-0.25)), 0.5*theta(x-0.25)*(1-theta(x-0.5)), x"
  splot "f(x)"
end
```
![503pm3dcolors/022](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/503pm3dcolors/image/022.png)
