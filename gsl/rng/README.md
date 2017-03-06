## Ruby script

* gsl/rng/rng.rb

```ruby
require "numo/narray"
require "numo/gsl"
require "numo/gnuplot"

def hist(dat,name=nil)
  f = case name
      when "cauchy"
        0.025
      when /levy/
        0.01
      end
  if f
    e = (dat.size*f).to_i
    dat = dat[dat.sort_index[e..-1-e]]
  end
  n = 100
  m = 30
  min,max = dat.minmax
  min = -m if min<-m
  max = m if max>m
  scale = (max-min)/n
  y = (dat-min)/scale
  y = y[y.ge(0) & y.le(n)]
  y = Numo::Int32.cast(y)
  x = (Numo::DFloat.new(n+1).seq+0.5) * scale + min
  [x, y.bincount]
end

def gplot(plot_args,setting,fn)
  Numo.gnuplot do
    set xlabel:"bin"
    set ylabel:"count"
    setting.each{|k,v| set k,v}
    plot(*plot_args)
    pause mouse:"any"
    output "img/"+fn+".png",size:[540,400]
    #output fn+".ps","color"
    reset
  end
end

rng = Numo::GSL::Rng.new
N = 100000

sigma = 1.0
a = 1.0
b = 2.0
c = 1.0
alpha = 1.5
beta = 0.5
mu = 1.0
zeta = 1.0
nu = 5.0
nu1 = 5.0
nu2 = 3.0
p = 0.5
n = 5
n1 = 5
n2 = 5
t = 5

[["gaussian",[sigma]],
 ["gaussian_ziggurat",[sigma]],
 ["gaussian_ratio_method",[sigma]],
 ["ugaussian",[]],
 ["ugaussian_ratio_method",[]],
 ["gaussian_tail",[a,sigma]],
 ["ugaussian_tail",[a]],
 ["exponential",[mu]],
 ["laplace",[a]],
 ["exppow",[a,b]],
 ["cauchy",[a]],
 ["rayleigh",[sigma]],
 ["rayleigh_tail",[a,sigma]],
 ["landau",[]],
 ["levy",[c,alpha]],
 ["levy_skew",[c,alpha,beta]],
 ["gamma",[a,b]],
 ["gamma_knuth",[a,b]],
 ["flat",[1,2]],
 ["lognormal",[zeta,sigma]],
 ["chisq",[nu]],
 ["fdist",[nu1,nu2]],
 ["tdist",[nu]],
 ["beta",[a,b]],
 ["logistic",[a]],
 ["pareto",[a,b]],
 ["weibull",[a,b]],
 ["gumbel1",[a,b]],
 ["gumbel2",[a,b]],
 ["poisson",[mu]],
 ["bernoulli",[p]],
 ["binomial",[p,n]],
 ["negative_binomial",[p,n]],
 ["pascal",[p,n]],
 ["geometric",[p]],
 ["hypergeometric",[n1,n2,t]],
 ["logarithmic",[p]],
].each do |m,a|
  dat = rng.send(m,*(a+[N]))
  s = {title:"Numo::GSL::Rng.#{m}(#{a.join(",")})"}
  gplot([*hist(dat,m),w:"histeps",t:m],s,m)
end

```

## Result plot

![gaussian.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gaussian.png)
![gaussian_ziggurat.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gaussian_ziggurat.png)
![gaussian_ratio_method.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gaussian_ratio_method.png)
![ugaussian.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/ugaussian.png)
![ugaussian_ratio_method.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/ugaussian_ratio_method.png)
![gaussian_tail.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gaussian_tail.png)
![ugaussian_tail.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/ugaussian_tail.png)
![exponential.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/exponential.png)
![laplace.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/laplace.png)
![exppow.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/exppow.png)
![cauchy.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/cauchy.png)
![rayleigh.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/rayleigh.png)
![rayleigh_tail.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/rayleigh_tail.png)
![landau.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/landau.png)
![levy.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/levy.png)
![levy_skew.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/levy_skew.png)
![gamma.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gamma.png)
![gamma_knuth.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gamma_knuth.png)
![flat.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/flat.png)
![lognormal.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/lognormal.png)
![chisq.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/chisq.png)
![fdist.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/fdist.png)
![tdist.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/tdist.png)
![beta.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/beta.png)
![logistic.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/logistic.png)
![pareto.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/pareto.png)
![weibull.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/weibull.png)
![gumbel1.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gumbel1.png)
![gumbel2.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/gumbel2.png)
![poisson.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/poisson.png)
![bernoulli.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/bernoulli.png)
![binomial.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/binomial.png)
![negative_binomial.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/negative_binomial.png)
![pascal.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/pascal.png)
![geometric.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/geometric.png)
![hypergeometric.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/hypergeometric.png)
![logarithmic.png](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/gsl/rng/img/image/logarithmic.png)
