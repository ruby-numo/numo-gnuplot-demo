## image data
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/image.html)

### 1

```ruby
# load binary data
blutux = Numo::UInt8.from_string(open("blutux.rgb").read,[128,128,3]).reverse(0)
blutux_ave = Numo::Int16.cast(blutux).sum(2)/3

# # demo for plotting images using pixels and binary 2d data
#
# set title "Larry Ewing's GIMP penguin on vacation basking in\nthe balmy waters off the coast of Murmansk"
# set xrange [-10:137]
# set yrange [-10:157]
# set label "\"I flew here... by plane.  Why?  For the halibut.\"" at 64,135 center
# plot 'blutux.rgb' binary array=(128,128) flipy format='%uchar' with rgbimage

Numo.gnuplot do
  set title:"Larry Ewing's GIMP penguin on vacation basking in\nthe balmy waters off the coast of Murmansk"
  set xrange:-10..137
  set yrange:-10..157
  set label:"\"I flew here... by plane.  Why?  For the halibut.\"", at:[64,135], center:true
  plot blutux, with:"rgbimage"
end
```
![image/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/001.png)

### 2

```ruby
# reset
# set title "Translations of position variables via 'using'"
# set xrange [-10:275]
# set yrange [-10:300]
# unset key
# set label "\"Time for a dip...\"" at 132,285 center
# plot 'blutux.rgb' binary array=(128,128) flipy center=( 64,201 ) format='%uchar' with rgbimage, \
#      'blutux.rgb' binary array=(128,128) flipy rotation=-90d center=(201,201) format='%uchar' with rgbimage, \
#      'blutux.rgb' binary array=(128,128) flip=y rotate=3.1415 center=(201,64) format='%uchar' with rgbimage, \
#      'blutux.rgb' binary array=(128,128) flip=y rot=0.5pi center=(64,64) format='%uchar' using 1:2:3 with rgbimage

Numo.gnuplot do
  reset
  set title:"Translations of position variables via 'using'"
  set xrange:-10..275
  set yrange:-10..300
  unset :key
  set label:"\"Time for a dip...\"", at:[132,285], center:true
  plot [blutux, 'center=( 64,201 )', with:"rgbimage"],
    [blutux, 'rotation=-90d center=(201,201)', with:"rgbimage"],
    [blutux, 'rotate=3.1415 center=(201,64)', with:"rgbimage"],
    [blutux, 'rot=0.5pi center=(64,64)', with:"rgbimage"]
end
```
![image/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/002.png)

### 3

```ruby
# reset
# unset key
# set xrange [-10:137]
# set yrange [-10:157]
# set label 1 "\"I am the penguin, GOO GOO GOO JOOB.\"" at 63,140 center
# set title "Palette mode 'image' used to produce psychedelic bird"
# unset colorbox
# plot 'blutux.rgb' binary array=(128,128) flipy format='%uchar%uchar%uchar' using ($1+$2+$3) with image

Numo.gnuplot do
  reset
  unset :key
  set xrange:-10..137
  set yrange:-10..157
  set :label, 1, "\"I am the penguin, GOO GOO GOO JOOB.\"", at:[63,140], center:true
  set title:"Palette mode 'image' used to produce psychedelic bird"
  unset :colorbox
  plot Numo::Int16.cast(blutux).sum(2), with:"image"
end
```
![image/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/003.png)

### 4

```ruby
# reset
# unset key
# set xrange [-10:137]
# set yrange [-10:157]
# set tics out
# set label 1 "\"This picture was taken by my friend Ansel Adams.\"" at 63,140 center
# set title "The palette can be changed from color to gray scale"
# set palette gray
# unset colorbox
# plot 'blutux.rgb' binary array=(128,128) flipy format='%uchar%uchar%uchar' using ($1+$2+$3)/3 with image

Numo.gnuplot do
  reset
  unset :key
  set xrange:-10..137
  set yrange:-10..157
  set :tics, :out
  set :label, 1, "\"This picture was taken by my friend Ansel Adams.\"", at:[63,140], center:true
  set title:"The palette can be changed from color to gray scale"
  set :palette, "gray"
  unset :colorbox
  plot blutux_ave, with:"image"
end
```
![image/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/004.png)

### 5

```ruby
# unset label 1
# unset key
# set pm3d map
# set xrange [10:117]
# set yrange [10:117]
# set tics out
# set colorbox
# set cbrange [0:255]
# set title "As with 3d color surfaces, a color box may be added to the plot"
# splot 'blutux.rgb' binary array=(128,128) flipy format='%uchar%uchar%uchar' using ($1+$2+$3)/3 with image

Numo.gnuplot do
  unset label:1
  unset :key
  set :pm3d, :map
  set xrange:10..117
  set yrange:10..117
  set :tics, :out
  set :colorbox
  set cbrange:0..255
  set title:"As with 3d color surfaces, a color box may be added to the plot"
  splot blutux_ave, with:"image"
end
```
![image/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/005.png)

### 6

```ruby
# set key
# set xrange [-10:138]
# set yrange [-10:138]
# set tics out
# set title "Polygons used to draw pixels for rotated images\nNotice the slower refresh rate than for the next plot"
# unset colorbox
# plot 'blutux.rgb' binary array=(128,128) dx=0.70711 dy=0.70711 flipy rotation=45d center=(63.5,63.5) format='%uchar' using ($1+$2+$3)/3 with image

Numo.gnuplot do
  set :key
  set xrange:-10..138
  set yrange:-10..138
  set :tics, :out
  set title:"Polygons used to draw pixels for rotated images\nNotice the slower refresh rate than for the next plot"
  unset :colorbox
  plot [blutux_ave, 'dx=0.70711 dy=0.70711 rotation=45d center=(63.5,63.5)', with:"image"]
end
```
![image/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/006.png)

### 7

```ruby
# reset
# unset key
# set xrange [-138:10]
# set yrange [-10:138]
# set tics out
# set title "Terminal image routine used to draw plot rotated about origin\nNotice the faster refresh rate than for the previous plot"
# unset colorbox
# plot 'blutux.rgb' binary array=(128,128) dx=1 flip=y rotation=0.5pi origin=(0,0) format='%uchar' using ($1+$2+$3)/3 with image

Numo.gnuplot do
  reset
  unset :key
  set xrange:-138..10
  set yrange:-10..138
  set :tics, :out
  set title:"Terminal image routine used to draw plot rotated about origin\nNotice the faster refresh rate than for the previous plot"
  unset :colorbox
  plot [blutux_ave, 'dx=1 rotation=0.5pi origin=(0,0)', with:"image"]
end
```
![image/007](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/007.png)

### 8

```ruby
# reset
# set size 1.0, 1.0
# set origin 0.0, 0.0
# set multiplot
# set size 0.5,0.48
# set origin 0.0,0.47
# unset key
# set xrange [-0.5:127.5]
# set yrange [-0.5:127.5]
# set tics out
# set label 1 "Selection of the input channels via \`using\`" at 140,160 center
# set title '"I do impersonations..."' offset 0,-0.5
# plot 'blutux.rgb' binary array=(128,128) flip=y format='%uchar' using 1:2:3 with rgbimage
# unset label 1
# set size 0.5,0.48
# set origin 0.5,0.47
# set title '"A cardinal."'
# plot 'blutux.rgb' binary array=(128,128) flip=y format='%uchar%*uchar%*uchar' using 1:(0):(0) with rgbimage
# set size 0.5,0.48
# set origin 0.0,0.0
# set title '"A parrot."'
# plot 'blutux.rgb' binary array=(128,128) flipy format='%*uchar%uchar%*uchar' using (0):1:(0) with rgbimage
# set size 0.5,0.48
# set origin 0.5,0.0
# set title '"A bluebird."'
# plot 'blutux.rgb' binary array=(128,128) flipy format='%*uchar%*uchar%uchar' using (0):(0):1 with rgbimage
# unset multiplot

Numo.gnuplot do
  reset
  set size:[1.0,1.0]
  set origin:[0.0,0.0]
  set :multiplot
  set size:[0.5,0.48]
  set origin:[0.0,0.47]
  unset :key
  set xrange:-0.5..127.5
  set yrange:-0.5..127.5
  set :tics, :out
  set :label, 1, "Selection of the input channels via 'using'", at:[140,160], center:true
  set title:'"I do impersonations..."', offset:[0,-0.5]
  plot blutux, with:"rgbimage"

  unset label:1
  set size:[0.5,0.48]
  set origin:[0.5,0.47]
  set title:'"A cardinal."'
  a = blutux.copy
  a[true,true,1..2] = 0
  plot a, with:"rgbimage"

  set size:[0.5,0.48]
  set origin:[0.0,0.0]
  set title:'"A parrot."'
  a = blutux.copy
  a[true,true,[0,2]] = 0
  plot a, with:"rgbimage"

  set size:[0.5,0.48]
  set origin:[0.5,0.0]
  set title:'"A bluebird."'
  a = blutux.copy
  a[true,true,0..1] = 0
  plot a, with:"rgbimage"
  unset :multiplot
end
```
![image/008](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/008.png)

### 9

```ruby
# reset
# set size 1.0, 1.0
# set origin 0.0, 0.0
# set multiplot
# set size 0.5,0.48
# set origin 0.0,0.47
# unset key
# set xrange [-0.5:127.5]
# set yrange [-0.5:127.5]
# set tics out
# set label 1 "Luminance adjustment via \`cbrange\`" at 140,160 center
# set title 'Lake Mendota, "or Wonk-sheck-ho-mik-la!"' offset 0,-0.5
# set cbrange [*:*]
# plot 'blutux.rgb' binary array=(128,128) flipy format='%uchar' using 1:2:3 with rgbimage
# unset label 1
# set size 0.5,0.48
# set origin 0.5,0.47
# set title '"Lucky I brought sunscreen."'
# set cbrange [0:200]
# plot 'blutux.rgb' binary array=(128,128) flip=y format='%uchar' using 1:2:3 with rgbimage
# set size 0.5,0.48
# set origin 0.0,0.0
# set title 'Sunset on the Terrace'
# set cbrange [0:400]
# plot 'blutux.rgb' binary array=(128,128) flip=y format='%uchar' using (1.5*$1):2:3 with rgbimage
# set size 0.5,0.48
# set origin 0.5,0.0
# set title 'Sultry evening'
# set cbrange [0:400]
# plot 'blutux.rgb' binary array=(128,128) flipy format='%uchar' using 1:2:3 with rgbimage, '-' w points pt 7 ps 6 lt -2, '-' w points pt 7 ps 0.65 lt -2
# 110 100
# e
# 10 95
# 38 120
# 82 102
# 26 82
# 93 108
# 41 99
# 123 84
# e
# unset multiplot

Numo.gnuplot do
  reset
  set size:[1.0,1.0]
  set origin:[0.0,0.0]
  set :multiplot
  set size:[0.5,0.48]
  set origin:[0.0,0.47]
  unset :key
  set xrange:-0.5..127.5
  set yrange:-0.5..127.5
  set :tics, :out
  set :label, 1, "Luminance adjustment via 'cbrange'", at:[140,160], center:true
  set title:'Lake Mendota, "or Wonk-sheck-ho-mik-la!"', offset:[0,-0.5]
  set cbrange:"[*:*]"
  plot blutux, with:"rgbimage"

  unset label:1
  set size:[0.5,0.48]
  set origin:[0.5,0.47]
  set title:'"Lucky I brought sunscreen."'
  set cbrange:0..200
  plot blutux, with:"rgbimage"

  set size:[0.5,0.48]
  set origin:[0.0,0.0]
  set title:'Sunset on the Terrace'
  set cbrange:0..400
  a = Numo::Int16.cast(blutux)
  a[true,true,0] *= 1.5
  plot a, with:"rgbimage"

  set size:[0.5,0.48]
  set origin:[0.5,0.0]
  set title:'Sultry evening'
  set cbrange:0..400
  circle = [[110],[110]]
  points = [[10,38,82,26,93,41,123],[95,120,102,82,108,99,84]]
  plot [blutux, with:"rgbimage"],
    [*circle, w:"points", pt:7, ps:6, lt:-2],
    [*points, w:"points", pt:7, ps:0.65, lt:-2]
  unset :multiplot
end
```
![image/009](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc/image/image/009.png)
