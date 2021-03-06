## plot key
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/key.html)

### 1

```ruby
# # Illustration of key positioning commands and concept.
# #
# # Dan Sebald, 7 nov 2004
# #
# set key default
# set key box
# set key samplen .2
#
# set multiplot layout 3,3
# set key ins vert
# set key left top
# set title "Key (ins vert left top)"
# plot x,-x
# set key center top
# set title "Key (ins vert center top)"
# replot
# set key right
# set title "Key (ins vert right top)"
# replot
# set key center left
# set title "Key (ins vert center left)"
# replot
# set key cent
# set title "Key (inside vertical center)"
# replot
# set key right
# set title "Key (ins vert cent right)"
# replot
# set key bottom left
# set title "Key (ins vert bot left)"
# replot
# set key bot center
# set title "Key (ins vert bot center)"
# replot
# set key right
# set title "Key (ins vert bot right)"
# replot
# unset multiplot

Numo.gnuplot do
  set :key, :default
  set :key, :box
  set :key, samplen:0.2
  set :multiplot, layout:[3,3]
  set :key, :ins, :vert
  set :key, :left, :top
  set title:"Key (ins vert left top)"
  plot "x",
    "-x"
  set :key, :center, :top
  set title:"Key (ins vert center top)"
  replot
  set :key, :right
  set title:"Key (ins vert right top)"
  replot
  set :key, :center, :left
  set title:"Key (ins vert center left)"
  replot
  set :key, :cent
  set title:"Key (inside vertical center)"
  replot
  set :key, :right
  set title:"Key (ins vert cent right)"
  replot
  set :key, :bottom, :left
  set title:"Key (ins vert bot left)"
  replot
  set :key, :bot, :center
  set title:"Key (ins vert bot center)"
  replot
  set :key, :right
  set title:"Key (ins vert bot right)"
  replot
  unset :multiplot
end
```
![801key/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/801key/image/001.png)

### 2

```ruby
# set multiplot layout 3,3
# set key horiz
# set key left top
# set title "Key (ins horiz left top)"
# replot
# set key center top
# set title "Key (ins horiz center top)"
# replot
# set key right
# set title "Key (ins horiz right top)"
# replot
# set key center left
# set title "Key (ins horiz center left)"
# replot
# set key cent
# set title "Key (inside horizontal center)"
# replot
# set key right
# set title "Key (ins horiz cent right)"
# replot
# set key bottom left
# set title "Key (ins horiz bot left)"
# replot
# set key bot center
# set title "Key (ins horiz bot center)"
# replot
# set key right
# set title "Key (ins horiz bot right)"
# replot
# unset multiplot

Numo.gnuplot do
  set :multiplot, layout:[3,3]
  set :key, :horiz
  set :key, :left, :top
  set title:"Key (ins horiz left top)"
  replot
  set :key, :center, :top
  set title:"Key (ins horiz center top)"
  replot
  set :key, :right
  set title:"Key (ins horiz right top)"
  replot
  set :key, :center, :left
  set title:"Key (ins horiz center left)"
  replot
  set :key, :cent
  set title:"Key (inside horizontal center)"
  replot
  set :key, :right
  set title:"Key (ins horiz cent right)"
  replot
  set :key, :bottom, :left
  set title:"Key (ins horiz bot left)"
  replot
  set :key, :bot, :center
  set title:"Key (ins horiz bot center)"
  replot
  set :key, :right
  set title:"Key (ins horiz bot right)"
  replot
  unset :multiplot
end
```
![801key/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/801key/image/002.png)

### 3

```ruby
# set multiplot layout 3,3
# set key out vert
# set key left top
# set title "Key (out vert left top)"
# replot
# set key center top
# set title "Key (out vert center top)"
# replot
# set key right
# set title "Key (out vert right top)"
# replot
# set key center left
# set title "Key (out vert center left)"
# replot
# set key cent
# set title "Key (outside vertical center)"
# replot
# set key right
# set title "Key (out vert cent right)"
# replot
# set key bottom left
# set title "Key (out vert bot left)"
# replot
# set key bot center
# set title "Key (out vert bot center)"
# replot
# set key right
# set title "Key (out vert bot right)"
# replot
# unset multiplot

Numo.gnuplot do
  set :multiplot, layout:[3,3]
  set :key, :out, :vert
  set :key, :left, :top
  set title:"Key (out vert left top)"
  replot
  set :key, :center, :top
  set title:"Key (out vert center top)"
  replot
  set :key, :right
  set title:"Key (out vert right top)"
  replot
  set :key, :center, :left
  set title:"Key (out vert center left)"
  replot
  set :key, :cent
  set title:"Key (outside vertical center)"
  replot
  set :key, :right
  set title:"Key (out vert cent right)"
  replot
  set :key, :bottom, :left
  set title:"Key (out vert bot left)"
  replot
  set :key, :bot, :center
  set title:"Key (out vert bot center)"
  replot
  set :key, :right
  set title:"Key (out vert bot right)"
  replot
  unset :multiplot
end
```
![801key/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/801key/image/003.png)

### 4

```ruby
# set multiplot layout 3,3
# set key horiz
# set key left top
# set title "Key (out horiz left top)"
# replot
# set key center top
# set title "Key (out horiz center top)"
# replot
# set key right
# set title "Key (out horiz right top)"
# replot
# set key center left
# set title "Key (out horiz center left)"
# replot
# set key cent
# set title "Key (outside horizontal center)"
# replot
# set key right
# set title "Key (out horiz cent right)"
# replot
# set key bottom left
# set title "Key (out horiz bot left)"
# replot
# set key bot center
# set title "Key (out horiz bot center)"
# replot
# set key right
# set title "Key (out horiz bot right)"
# replot
# unset multiplot

Numo.gnuplot do
  set :multiplot, layout:[3,3]
  set :key, :horiz
  set :key, :left, :top
  set title:"Key (out horiz left top)"
  replot
  set :key, :center, :top
  set title:"Key (out horiz center top)"
  replot
  set :key, :right
  set title:"Key (out horiz right top)"
  replot
  set :key, :center, :left
  set title:"Key (out horiz center left)"
  replot
  set :key, :cent
  set title:"Key (outside horizontal center)"
  replot
  set :key, :right
  set title:"Key (out horiz cent right)"
  replot
  set :key, :bottom, :left
  set title:"Key (out horiz bot left)"
  replot
  set :key, :bot, :center
  set title:"Key (out horiz bot center)"
  replot
  set :key, :right
  set title:"Key (out horiz bot right)"
  replot
  unset :multiplot
end
```
![801key/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/801key/image/004.png)

### 5

```ruby
# set multiplot layout 3,3
# set key vert
# set arrow 1 from -3,0 to 3,0 nohead lt -1
# set arrow 2 from 0,-3 to 0,3 nohead lt -1
# set key at 0,0 left top
# set title "Key (<manual> vert left top)"
# replot
# set key at 0,0 center top
# set title "Key (<manual> vert center top)"
# replot
# set key at 0,0 right
# set title "Key (<manual> vert right top)"
# replot
# set key at 0,0 center left
# set title "Key (<manual> vert center left)"
# replot
# set key at 0,0 cent
# set title "Key (<manual> vertical center)"
# replot
# set key at 0,0 right
# set title "Key (<manual> vert cent right)"
# replot
# set key at 0,0 bottom left
# set title "Key (<manual> vert bot left)"
# replot
# set key at 0,0 bot center
# set title "Key (<manual> vert bot center)"
# replot
# set key at 0,0 right
# set title "Key (<manual> vert bot right)"
# replot
# unset multiplot

Numo.gnuplot do
  set :multiplot, layout:[3,3]
  set :key, :vert
  set :arrow, 1, from:[-3,0], to:[3,0], nohead:true, lt:-1
  set :arrow, 2, from:[0,-3], to:[0,3], nohead:true, lt:-1
  set :key, at:[0,0], left:true, top:true
  set title:"Key (<manual> vert left top)"
  replot
  set :key, at:[0,0], center:true, top:true
  set title:"Key (<manual> vert center top)"
  replot
  set :key, at:[0,0], right:true
  set title:"Key (<manual> vert right top)"
  replot
  set :key, at:[0,0], center:true, left:true
  set title:"Key (<manual> vert center left)"
  replot
  set :key, at:[0,0], cent:true
  set title:"Key (<manual> vertical center)"
  replot
  set :key, at:[0,0], right:true
  set title:"Key (<manual> vert cent right)"
  replot
  set :key, at:[0,0], bottom:true, left:true
  set title:"Key (<manual> vert bot left)"
  replot
  set :key, at:[0,0], bot:true, center:true
  set title:"Key (<manual> vert bot center)"
  replot
  set :key, at:[0,0], right:true
  set title:"Key (<manual> vert bot right)"
  replot
  unset :multiplot
end
```
![801key/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/801key/image/005.png)

### 6

```ruby
# set multiplot layout 3,3
# set key horiz
# set arrow 1 from -3,0 to 3,0 nohead lt -1
# set arrow 2 from 0,-3 to 0,3 nohead lt -1
# set key at 0,0 left top
# set title "Key (<manual> horiz left top)"
# set xrange [-5:15]
# replot
# set key at 0,0 center top
# set title "Key (<manual> horiz center top)"
# set xrange [-10:10]
# replot
# set key at 0,0 right
# set title "Key (<manual> horiz right top)"
# set xrange [-15:5]
# replot
# set key at 0,0 center left
# set title "Key (<manual> horiz center left)"
# set xrange [-5:15]
# replot
# set key at 0,0 cent
# set title "Key (<manual> horizontal center)"
# set xrange [-10:10]
# replot
# set key at 0,0 right
# set title "Key (<manual> horiz cent right)"
# set xrange [-15:5]
# replot
# set key at 0,0 bottom left
# set title "Key (<manual> horiz bot left)"
# set xrange [-5:15]
# replot
# set key at 0,0 bot center
# set title "Key (<manual> horiz bot center)"
# set xrange [-10:10]
# replot
# set key at 0,0 right
# set title "Key (<manual> horiz bot right)"
# set xrange [-15:5]
# replot
# unset multiplot

Numo.gnuplot do
  set :multiplot, layout:[3,3]
  set :key, :horiz
  set :arrow, 1, from:[-3,0], to:[3,0], nohead:true, lt:-1
  set :arrow, 2, from:[0,-3], to:[0,3], nohead:true, lt:-1
  set :key, at:[0,0], left:true, top:true
  set title:"Key (<manual> horiz left top)"
  set xrange:-5..15
  replot
  set :key, at:[0,0], center:true, top:true
  set title:"Key (<manual> horiz center top)"
  set xrange:-10..10
  replot
  set :key, at:[0,0], right:true
  set title:"Key (<manual> horiz right top)"
  set xrange:-15..5
  replot
  set :key, at:[0,0], center:true, left:true
  set title:"Key (<manual> horiz center left)"
  set xrange:-5..15
  replot
  set :key, at:[0,0], cent:true
  set title:"Key (<manual> horizontal center)"
  set xrange:-10..10
  replot
  set :key, at:[0,0], right:true
  set title:"Key (<manual> horiz cent right)"
  set xrange:-15..5
  replot
  set :key, at:[0,0], bottom:true, left:true
  set title:"Key (<manual> horiz bot left)"
  set xrange:-5..15
  replot
  set :key, at:[0,0], bot:true, center:true
  set title:"Key (<manual> horiz bot center)"
  set xrange:-10..10
  replot
  set :key, at:[0,0], right:true
  set title:"Key (<manual> horiz bot right)"
  set xrange:-15..5
  replot
  unset :multiplot
end
```
![801key/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/801key/image/006.png)
