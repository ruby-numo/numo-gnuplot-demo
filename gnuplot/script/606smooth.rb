#
# binning/histograms
# http://gnuplot.sourceforge.net/demo_4.6/smooth.html
require_relative "gpl"

# bin(x, s) = s*int(x/s)
# 
# set zeroaxis
# 
# # Uniform
# set title "Uniform Distribution"
# set key top right
# set boxwidth 0.05
# plot [-0.1:1.1][-0.4:1.5] "random-points" u 1:(0.25*rand(0)-.35) t '', \
#      "" u (bin($1,0.05)):(20/300.) s f t 'smooth frequency' w boxes, \
#      "" u 1:(1/300.) s cumul t 'smooth cumulative'

gpl do
  run "bin(x, s) = s*int(x/s)"
  set :zeroaxis
  set title:"Uniform Distribution"
  set :key, :top, :right
  set boxwidth:0.05
  plot  -0.1..1.1, -0.4..1.5,
    ["\"random-points\"", u:'1:(0.25*rand(0)-.35)', t:''],
    ["\"\"", u:'(bin($1,0.05)):(20/300.)', s:true, f:true, t:'smooth frequency', w:"boxes"],
    ["\"\"", u:'1:(1/300.)', s:"cumul", t:'smooth cumulative']
end

# # Normal
# set title "Normal Distribution"
# set key top left
# set boxwidth 0.05
# plot "random-points" u 2:(0.25*rand(0)-.35) t '', \
#      "" u (bin($2,0.05)):(20/300.) s f t 'smooth frequency' w boxes, \
#      "" u 2:(1/300.) s cumul t 'smooth cumulative'

gpl do
  set title:"Normal Distribution"
  set :key, :top, :left
  set boxwidth:0.05
  plot ["\"random-points\"", u:'2:(0.25*rand(0)-.35)', t:''],
    ["\"\"", u:'(bin($2,0.05)):(20/300.)', s:true, f:true, t:'smooth frequency', w:"boxes"],
    ["\"\"", u:'2:(1/300.)', s:"cumul", t:'smooth cumulative']
end

# # Lognormal
# set title "Lognormal Distribution"
# set key top right
# set boxwidth 0.1
# plot [0:] "random-points" u 3:(0.25*rand(0)-.35) t '', \
#     "" u (bin($3,0.1)):(10/300.) s f t 'smooth frequency' w boxes, \
#     "" u 3:(1/300.) s cumul t 'smooth cumulative'

gpl do
  set title:"Lognormal Distribution"
  set :key, :top, :right
  set boxwidth:0.1
  plot "[0:]",
    ["\"random-points\"", u:'3:(0.25*rand(0)-.35)', t:''],
    ["\"\"", u:'(bin($3,0.1)):(10/300.)', s:true, f:true, t:'smooth frequency', w:"boxes"],
    ["\"\"", u:'3:(1/300.)', s:"cumul", t:'smooth cumulative']
end

# # Mixed
# set title "Mixed Distribution (Lognormal with shifted Gaussian)"
# set key top right
# set boxwidth 0.1
# plot "random-points" u 4:(0.25*rand(0)-.35) t '', \
#      "" u (bin($4,0.1)):(10/300.) s f t 'smooth frequency' w boxes, \
#      "" u 4:(1/300.) s cumul t 'smooth cumulative'

gpl do
  set title:"Mixed Distribution (Lognormal with shifted Gaussian)"
  set :key, :top, :right
  set boxwidth:0.1
  plot ["\"random-points\"", u:'4:(0.25*rand(0)-.35)', t:''],
    ["\"\"", u:'(bin($4,0.1)):(10/300.)', s:true, f:true, t:'smooth frequency', w:"boxes"],
    ["\"\"", u:'4:(1/300.)', s:"cumul", t:'smooth cumulative']
end

