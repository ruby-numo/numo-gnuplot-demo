## pm3d gamma
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/pm3dgamma.html)

### 1

```ruby
# # Test of gamma correction for gray palettes
#
# set pm3d; set palette
# set palette gray
# set pm3d map
# set cbrange [-10:10]
# set xrange [-10:10]
# set yrange [*:*]
# unset ztics
# unset ytics
# set samples 101
# set isosamples 2
# set xtics 2
#
# set palette gamma 0.75
# set title "gamma = 0.75"
# splot x

Numo.gnuplot do
  set :pm3d; set :palette
  set :palette, "gray"
  set :pm3d, :map
  set cbrange:-10..10
  set xrange:-10..10
  set yrange:"[*:*]"
  unset :ztics
  unset :ytics
  set samples:101
  set isosamples:2
  set xtics:2
  set :palette, gamma:0.75
  set title:"gamma = 0.75"
  splot "x"
end
```
![504pm3dgamma/001](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/504pm3dgamma/image/001.png)

### 2

```ruby
# set palette gamma 1.0
# set title "gamma = 1.0"
# splot x

Numo.gnuplot do
  set :palette, gamma:1.0
  set title:"gamma = 1.0"
  splot "x"
end
```
![504pm3dgamma/002](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/504pm3dgamma/image/002.png)

### 3

```ruby
# set palette gamma 1.25
# set title "gamma = 1.25"
# splot x

Numo.gnuplot do
  set :palette, gamma:1.25
  set title:"gamma = 1.25"
  splot "x"
end
```
![504pm3dgamma/003](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/504pm3dgamma/image/003.png)

### 4

```ruby
# set palette gamma 1.5
# set title "gamma = 1.5"
# splot x

Numo.gnuplot do
  set :palette, gamma:1.5
  set title:"gamma = 1.5"
  splot "x"
end
```
![504pm3dgamma/004](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/504pm3dgamma/image/004.png)

### 5

```ruby
# set palette gamma 1.75
# set title "gamma = 1.75"
# splot x

Numo.gnuplot do
  set :palette, gamma:1.75
  set title:"gamma = 1.75"
  splot "x"
end
```
![504pm3dgamma/005](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/504pm3dgamma/image/005.png)

### 6

```ruby
# set palette gamma 2.0
# set title "gamma = 2.0"
# splot x

Numo.gnuplot do
  set :palette, gamma:2.0
  set title:"gamma = 2.0"
  splot "x"
end
```
![504pm3dgamma/006](https://raw.githubusercontent.com/ruby-numo/numo-gnuplot-demo/master/gnuplot/md/504pm3dgamma/image/006.png)
