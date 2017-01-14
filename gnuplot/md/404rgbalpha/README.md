## RGB + alpha channel
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/rgbalpha.html)

### 1

```ruby
# set border linecolor rgb "gold"
# set key title "Plot style rgbalpha" textcolor rgb "gold" 
# set key bottom left at screen .75, screen .75
# set key Left width -7 sample 1
# 
# set object  1 rect from screen 0, 0 to screen 1, 1 behind \
#               fc rgb "gray10"  fillstyle  solid 1.00 noborder
# set samples 128, 128
# set size ratio 0.95
# set bmargin at screen .1
# set tmargin at screen .9
# set lmargin at screen .1
# 
# set xrange [ 0. : 128. ] 
# set yrange [ 0. : 128. ]
# 
# # Alpha =  linear gradient on x
# 
# plot 100.*(.4+sin(x/5.)/(x/5.)) lw 5 title 'solid line', \
#      'lena.rgb' binary array=(128,128) format="%uchar" flipy using 1:2:3:(2.*column(0)) \
#                 with rgbalpha title "Lena with linear\nalpha gradient"

Numo.gnuplot do
  set :border, :linecolor, rgb:"gold"
  set :key, title:"Plot style rgbalpha", textcolor_rgb:"gold"
  set :key, :bottom, :left, at:"screen .75, screen .75"
  set :key, :Left, width:-7, sample:1
  set :object, 1, "rect", from_screen:[0,0], to_screen:[1,1], behind:true, fc_rgb:"gray10", fillstyle_solid:1.00, noborder:true
  set samples:[128,128]
  set :size, :ratio, 0.95
  set :bmargin, :at, screen:0.1
  set :tmargin, :at, screen:0.9
  set :lmargin, :at, screen:0.1
  set xrange:0.0..128.0
  set yrange:0.0..128.0
  plot ["100.*(.4+sin(x/5.)/(x/5.))", lw:5, title:'solid line'],
    ["'lena.rgb'", binary:'array=(128,128) format="%uchar" flipy', using:'1:2:3:(2.*column(0))', with:"rgbalpha", title:"Lena with linear\nalpha gradient"]
end
```
![404rgbalpha/001](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/404rgbalpha/image/001.png)

### 2

```ruby
# # Alpha = circular mask
# 
# focus(x,y) = ((column(0)-x)**2 + (column(-1)-(127-y))**2) > 400 ? 0 : 255
# 
# plot 100.*(.4+sin(x/5.)/(x/5.)) lw 5 title 'solid line', \
#      'lena.rgb' binary array=(128,128) format="%uchar" flipy using 1:2:3:(focus(70,50)) \
#                 with rgbalpha title "Lena with circular mask"

Numo.gnuplot do
  run "focus(x,y) = ((column(0)-x)**2 + (column(-1)-(127-y))**2) > 400 ? 0 : 255"
  plot ["100.*(.4+sin(x/5.)/(x/5.))", lw:5, title:'solid line'],
    ["'lena.rgb'", binary:'array=(128,128) format="%uchar" flipy', using:'1:2:3:(focus(70,50))', with:"rgbalpha", title:"Lena with circular mask"]
end
```
![404rgbalpha/002](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/404rgbalpha/image/002.png)
