## bar chart art
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/barchart_art.html)

### 1

```ruby
# # Demo of using rescaled images to construct a bar chart
# #
# if (!strstrt(GPVAL_COMPILE_OPTIONS,"+GD_PNG")) \
#     print ">>> Skipping demo <<<\n" ; \
#     print "This copy of gnuplot was built without support for loading png images" ;\
#     exit ;
# 
# reset
# set title "Building Code Height Limits"
# unset key
# 
# set xrange [ -10 : 160 ]
# set yrange [   0 : 200 ]
# set y2range[   0 : 200 ]
# 
# set y2tics
# set grid y
# 
# set xtics   ("NE" 12.0, "S" 42.0, "Downtown" 72.0, "Suburbs" 127.0)  scale 0.0
# 
# plot 'bldg.png' binary filetype=png origin=(60,0) dx=0.5 dy=1.5 with rgbimage, \
#      'bldg.png' binary filetype=png origin=(0,0) dx=0.5 dy=1 with rgbimage, \
#      'bldg.png' binary filetype=png origin=(30,0) dx=0.5 dy=0.7 with rgbimage, \
#      'bldg.png' binary filetype=png origin=(100,0) dx=0.5 dy=0.35 with rgbimage, \
#      'bldg.png' binary filetype=png origin=(125,0) dx=0.5 dy=0.35 with rgbimage

Numo.gnuplot do
  reset
  set title:"Building Code Height Limits"
  unset :key
  set xrange:-10..160
  set yrange:0..200
  set y2range:0..200
  set :y2tics
  set grid:"y"
  set xtics:'("NE" 12.0, "S" 42.0, "Downtown" 72.0, "Suburbs" 127.0)', scale:0.0
  plot ["'bldg.png'", binary:'filetype=png origin=(60,0) dx=0.5 dy=1.5', with:"rgbimage"],
    ["'bldg.png'", binary:'filetype=png origin=(0,0) dx=0.5 dy=1', with:"rgbimage"],
    ["'bldg.png'", binary:'filetype=png origin=(30,0) dx=0.5 dy=0.7', with:"rgbimage"],
    ["'bldg.png'", binary:'filetype=png origin=(100,0) dx=0.5 dy=0.35', with:"rgbimage"],
    ["'bldg.png'", binary:'filetype=png origin=(125,0) dx=0.5 dy=0.35', with:"rgbimage"]
end
```
![405barchart_art/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/405barchart_art/image/001.png)
