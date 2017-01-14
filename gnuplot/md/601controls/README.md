## control models
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/controls.html)

### 1

```ruby
# # warning:  this demo is SLOW on PCs without math coprocessors!
# #
# # From _Automatic_Control_Systems_, fourth ed., figure 6-14
# # transient response of a second-order system to a unit step input function
# #
# damp(t) = exp(-s*wn*t)/sqrt(1.0-s*s)
# per(t) = sin(wn*sqrt(1.0-s**2)*t - atan(-sqrt(1.0-s**2)/s))
# c(t) = 1-damp(t)*per(t)
# #
# #	wn is natural undamped frequency
# #	s is damping factor
# #
# wn = 1.0
# set xrange [0:13]
# set samples 50
# set dummy t
# set key box
# #
# # plot c(t) for several different damping factors s
# #
# plot s=.1,c(t),s=.3,c(t),s=.5,c(t),s=.7,c(t),s=.9,c(t),s=1.0,c(t),s=1.5,c(t),s=2.0,c(t)

Numo.gnuplot do
  run "damp(t) = exp(-s*wn*t)/sqrt(1.0-s*s)"
  run "per(t) = sin(wn*sqrt(1.0-s**2)*t - atan(-sqrt(1.0-s**2)/s))"
  run "c(t) = 1-damp(t)*per(t)"
  run "wn = 1.0"
  set xrange:0..13
  set samples:50
  set :dummy, t_nq:''
  set :key, :box
  plot "s=.1",
    "c(t)",
    "s=.3",
    "c(t)",
    "s=.5",
    "c(t)",
    "s=.7",
    "c(t)",
    "s=.9",
    "c(t)",
    "s=1.0",
    "c(t)",
    "s=1.5",
    "c(t)",
    "s=2.0",
    "c(t)"
end
```
![601controls/001](https://raw.github.com/ruby-numo/gnuplot-demo/master/gnuplot/md/601controls/image/001.png)
