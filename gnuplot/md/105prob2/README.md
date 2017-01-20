## probability
[Original Demo](http://gnuplot.sourceforge.net/demo_4.6/prob2.html)

### 1

```ruby
# # Demo Statistical Approximations version 1.1
# #
# # Copyright (c) 1991, Jos van der Woude, jvdwoude@hut.nl
# 
# # History:
# #    -- --- 1991 Jos van der Woude:  1st version
# #    06 Jun 2006 Dan Sebald:  Added plot methods for better visual effect.
# 
# print ""
# print "                        Statistical Approximations, version 1.1"
# print ""
# print "        Copyright (c) 1991, 1992, Jos van de Woude, jvdwoude@hut.nl"
# print ""
# print "     NOTE: contains 10 plots and consequently takes some time to run"
# print "                      Press Ctrl-C to exit right now"
# print ""
# 
# load "stat.inc"
# rnd(x) = floor(x+0.5)
# r_xmin = -1
# r_sigma = 4.0
# 
# # Binomial PDF using normal approximation
# n = 25; p = 0.15
# mu = n * p
# sigma = sqrt(n * p * (1.0 - p))
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * binom(floor((n+1)*p), n, p) #mode of binomial PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "binomial PDF using normal approximation"
# set arrow from mu, 0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot binom(rnd(x), n, p) with histeps, normal(x, mu, sigma)

Numo.gnuplot do
  load "stat.inc"
  run "rnd(x) = floor(x+0.5)"
  run "r_xmin = -1"
  run "r_sigma = 4.0"
  run "n = 25; p = 0.15"
  run "mu = n * p"
  run "sigma = sqrt(n * p * (1.0 - p))"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * binom(floor((n+1)*p), n, p) #mode of binomial PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"binomial PDF using normal approximation"
  set :arrow, from:"mu, 0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot ["binom(rnd(x), n, p)", with:"histeps"],
    "normal(x, mu, sigma)"
end
```
![105prob2/001](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/001.png)

### 2

```ruby
# unset arrow
# unset label
# 
# # Binomial PDF using poisson approximation
# n = 50; p = 0.1
# mu = n * p
# sigma = sqrt(mu)
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * binom(floor((n+1)*p), n, p) #mode of binomial PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample (xmax - xmin + 3)
# set title "binomial PDF using poisson approximation"
# set arrow from mu, 0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot binom(x, n, p) with histeps, poisson(x, mu) with histeps

Numo.gnuplot do
  unset :arrow
  unset :label
  run "n = 50; p = 0.1"
  run "mu = n * p"
  run "sigma = sqrt(mu)"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * binom(floor((n+1)*p), n, p) #mode of binomial PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:'(xmax - xmin + 3)'
  set title:"binomial PDF using poisson approximation"
  set :arrow, from:"mu, 0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot ["binom(x, n, p)", with:"histeps"],
    ["poisson(x, mu)", with:"histeps"]
end
```
![105prob2/002](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/002.png)

### 3

```ruby
# unset arrow
# unset label
# 
# # Geometric PDF using gamma approximation
# p = 0.3
# mu = (1.0 - p) / p
# sigma = sqrt(mu / p)
# lambda = p
# rho = 1.0 - p
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * p
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "geometric PDF using gamma approximation"
# set arrow from mu, 0 to mu, gmm(mu, rho, lambda) nohead
# set arrow from mu, gmm(mu + sigma, rho, lambda) \
#           to mu + sigma, gmm(mu + sigma, rho, lambda) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, gmm(mu + sigma, rho, lambda)
# plot geometric(rnd(x),p) with histeps, gmm(x, rho, lambda)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "p = 0.3"
  run "mu = (1.0 - p) / p"
  run "sigma = sqrt(mu / p)"
  run "lambda = p"
  run "rho = 1.0 - p"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * p"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"geometric PDF using gamma approximation"
  set :arrow, from:"mu, 0", to:"mu, gmm(mu, rho, lambda)", nohead:true
  set :arrow, from:"mu, gmm(mu + sigma, rho, lambda)", to:"mu + sigma, gmm(mu + sigma, rho, lambda)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, gmm(mu + sigma, rho, lambda)"
  plot ["geometric(rnd(x),p)", with:"histeps"],
    "gmm(x, rho, lambda)"
end
```
![105prob2/003](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/003.png)

### 4

```ruby
# unset arrow
# unset label
# 
# # Geometric PDF using normal approximation
# p = 0.3
# mu = (1.0 - p) / p
# sigma = sqrt(mu / p)
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * p
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "geometric PDF using normal approximation"
# set arrow from mu, 0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot geometric(rnd(x),p) with histeps, normal(x, mu, sigma)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "p = 0.3"
  run "mu = (1.0 - p) / p"
  run "sigma = sqrt(mu / p)"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * p"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"geometric PDF using normal approximation"
  set :arrow, from:"mu, 0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot ["geometric(rnd(x),p)", with:"histeps"],
    "normal(x, mu, sigma)"
end
```
![105prob2/004](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/004.png)

### 5

```ruby
# unset arrow
# unset label
# 
# # Hypergeometric PDF using binomial approximation
# nn = 75; mm = 25; n = 10
# p = real(mm) / nn
# mu = n * p
# sigma = sqrt(real(nn - n) / (nn - 1.0) * n * p * (1.0 - p))
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * hypgeo(floor(mu), nn, mm, n) #mode of binom PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample (xmax - xmin + 3)
# set title "hypergeometric PDF using binomial approximation"
# set arrow from mu, 0 to mu, binom(floor(mu), n, p) nohead
# set arrow from mu, binom(floor(mu + sigma), n, p) \
#           to mu + sigma, binom(floor(mu + sigma), n, p) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, binom(floor(mu + sigma), n, p)
# plot hypgeo(x, nn, mm, n) with histeps, binom(x, n, p) with histeps

Numo.gnuplot do
  unset :arrow
  unset :label
  run "nn = 75; mm = 25; n = 10"
  run "p = real(mm) / nn"
  run "mu = n * p"
  run "sigma = sqrt(real(nn - n) / (nn - 1.0) * n * p * (1.0 - p))"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * hypgeo(floor(mu), nn, mm, n) #mode of binom PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:'(xmax - xmin + 3)'
  set title:"hypergeometric PDF using binomial approximation"
  set :arrow, from:"mu, 0", to:"mu, binom(floor(mu), n, p)", nohead:true
  set :arrow, from:"mu, binom(floor(mu + sigma), n, p)", to:"mu + sigma, binom(floor(mu + sigma), n, p)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, binom(floor(mu + sigma), n, p)"
  plot ["hypgeo(x, nn, mm, n)", with:"histeps"],
    ["binom(x, n, p)", with:"histeps"]
end
```
![105prob2/005](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/005.png)

### 6

```ruby
# unset arrow
# unset label
# 
# # Hypergeometric PDF using normal approximation
# nn = 75; mm = 25; n = 10
# p = real(mm) / nn
# mu = n * p
# sigma = sqrt(real(nn - n) / (nn - 1.0) * n * p * (1.0 - p))
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * hypgeo(floor(mu), nn, mm, n) #mode of binom PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "hypergeometric PDF using normal approximation"
# set arrow from mu, 0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot hypgeo(rnd(x), nn, mm, n) with histeps, normal(x, mu, sigma)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "nn = 75; mm = 25; n = 10"
  run "p = real(mm) / nn"
  run "mu = n * p"
  run "sigma = sqrt(real(nn - n) / (nn - 1.0) * n * p * (1.0 - p))"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * hypgeo(floor(mu), nn, mm, n) #mode of binom PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"hypergeometric PDF using normal approximation"
  set :arrow, from:"mu, 0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot ["hypgeo(rnd(x), nn, mm, n)", with:"histeps"],
    "normal(x, mu, sigma)"
end
```
![105prob2/006](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/006.png)

### 7

```ruby
# unset arrow
# unset label
# 
# # Negative binomial PDF using gamma approximation
# r = 8; p = 0.6
# mu = r * (1.0 - p) / p
# sigma = sqrt(mu / p)
# lambda = p
# rho = r * (1.0 - p)
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * gmm((rho - 1) / lambda, rho, lambda) #mode of gamma PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "negative binomial PDF using gamma approximation"
# set arrow from mu, 0 to mu, gmm(mu, rho, lambda) nohead
# set arrow from mu, gmm(mu + sigma, rho, lambda) \
#           to mu + sigma, gmm(mu + sigma, rho, lambda) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, gmm(mu + sigma, rho, lambda)
# plot negbin(rnd(x), r, p) with histeps, gmm(x, rho, lambda)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "r = 8; p = 0.6"
  run "mu = r * (1.0 - p) / p"
  run "sigma = sqrt(mu / p)"
  run "lambda = p"
  run "rho = r * (1.0 - p)"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * gmm((rho - 1) / lambda, rho, lambda) #mode of gamma PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"negative binomial PDF using gamma approximation"
  set :arrow, from:"mu, 0", to:"mu, gmm(mu, rho, lambda)", nohead:true
  set :arrow, from:"mu, gmm(mu + sigma, rho, lambda)", to:"mu + sigma, gmm(mu + sigma, rho, lambda)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, gmm(mu + sigma, rho, lambda)"
  plot ["negbin(rnd(x), r, p)", with:"histeps"],
    "gmm(x, rho, lambda)"
end
```
![105prob2/007](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/007.png)

### 8

```ruby
# unset arrow
# unset label
# 
# # Negative binomial PDF using normal approximation
# r = 8; p = 0.4
# mu = r * (1.0 - p) / p
# sigma = sqrt(mu / p)
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * negbin(floor((r-1)*(1-p)/p), r, p) #mode of gamma PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "negative binomial PDF using normal approximation"
# set arrow from mu, 0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot negbin(rnd(x), r, p) with histeps, normal(x, mu, sigma)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "r = 8; p = 0.4"
  run "mu = r * (1.0 - p) / p"
  run "sigma = sqrt(mu / p)"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * negbin(floor((r-1)*(1-p)/p), r, p) #mode of gamma PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"negative binomial PDF using normal approximation"
  set :arrow, from:"mu, 0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot ["negbin(rnd(x), r, p)", with:"histeps"],
    "normal(x, mu, sigma)"
end
```
![105prob2/008](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/008.png)

### 9

```ruby
# unset arrow
# unset label
# 
# # Normal PDF using logistic approximation
# mu = 1.0; sigma = 1.5
# a = mu
# lambda = pi / (sqrt(3.0) * sigma)
# xmin = mu - r_sigma * sigma
# xmax = mu + r_sigma * sigma
# ymax = 1.1 * logistic(mu, a, lambda) #mode of logistic PDF used
# set key box
# unset zeroaxis
# set xrange [xmin: xmax]
# set yrange [0 : ymax]
# set xlabel "x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%.1f"
# set format y "%.2f"
# set sample 200
# set title "normal PDF using logistic approximation"
# set arrow from mu,0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot logistic(x, a, lambda), normal(x, mu, sigma)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "mu = 1.0; sigma = 1.5"
  run "a = mu"
  run "lambda = pi / (sqrt(3.0) * sigma)"
  run "xmin = mu - r_sigma * sigma"
  run "xmax = mu + r_sigma * sigma"
  run "ymax = 1.1 * logistic(mu, a, lambda) #mode of logistic PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin:xmax]"
  set yrange:"[0:ymax]"
  set xlabel:"x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%.1f"
  set format_y:"%.2f"
  set sample:200
  set title:"normal PDF using logistic approximation"
  set :arrow, from:"mu,0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot "logistic(x, a, lambda)",
    "normal(x, mu, sigma)"
end
```
![105prob2/009](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/009.png)

### 10

```ruby
# unset arrow
# unset label
# 
# # Poisson PDF using normal approximation
# mu = 5.0
# sigma = sqrt(mu)
# xmin = floor(mu - r_sigma * sigma)
# xmin = xmin < r_xmin ? r_xmin : xmin
# xmax = ceil(mu + r_sigma * sigma)
# ymax = 1.1 * poisson(mu, mu) #mode of poisson PDF used
# set key box
# unset zeroaxis
# set xrange [xmin - 1 : xmax + 1]
# set yrange [0 : ymax]
# set xlabel "k, x ->"
# set ylabel "probability density ->"
# set ytics 0, ymax / 10.0, ymax
# set format x "%2.0f"
# set format y "%3.2f"
# set sample 200
# set title "poisson PDF using normal approximation"
# set arrow from mu, 0 to mu, normal(mu, mu, sigma) nohead
# set arrow from mu, normal(mu + sigma, mu, sigma) \
#           to mu + sigma, normal(mu + sigma, mu, sigma) nohead
# set label "mu" at mu + 0.5, ymax / 10
# set label "sigma" at mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)
# plot poisson(rnd(x), mu) with histeps, normal(x, mu, sigma)

Numo.gnuplot do
  unset :arrow
  unset :label
  run "mu = 5.0"
  run "sigma = sqrt(mu)"
  run "xmin = floor(mu - r_sigma * sigma)"
  run "xmin = xmin < r_xmin ? r_xmin : xmin"
  run "xmax = ceil(mu + r_sigma * sigma)"
  run "ymax = 1.1 * poisson(mu, mu) #mode of poisson PDF used"
  set :key, :box
  unset :zeroaxis
  set xrange:"[xmin-1:xmax+1]"
  set yrange:"[0:ymax]"
  set xlabel:"k, x ->"
  set ylabel:"probability density ->"
  set ytics:'0,ymax/10.0,ymax'
  set format_x:"%2.0f"
  set format_y:"%3.2f"
  set sample:200
  set title:"poisson PDF using normal approximation"
  set :arrow, from:"mu, 0", to:"mu, normal(mu, mu, sigma)", nohead:true
  set :arrow, from:"mu, normal(mu + sigma, mu, sigma)", to:"mu + sigma, normal(mu + sigma, mu, sigma)", nohead:true
  set label:"mu", at:"mu + 0.5, ymax / 10"
  set label:"sigma", at:"mu + 0.5 + sigma, normal(mu + sigma, mu, sigma)"
  plot ["poisson(rnd(x), mu)", with:"histeps"],
    "normal(x, mu, sigma)"
end
```
![105prob2/010](https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/gnuplot/md/105prob2/image/010.png)
