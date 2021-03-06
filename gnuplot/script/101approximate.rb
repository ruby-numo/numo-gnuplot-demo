#
# approximation
# http://gnuplot.sourceforge.net/demo_4.6/approximate.html
require_relative "gpl"

# # Show use of pseudodata mechanism '+' to use plot styles with more than 
# # one relevant value per x coordinate. In this example we use the style
# # "filledcurves" to show the difference between two analytic functions.
# # This corresponds to the specification of multiple columns in the 
# # 'using' option for input from data files.
# # 
# #
# approx_1(x) = x - x**3/6
# approx_2(x) = x - x**3/6 + x**5/120 
# approx_3(x) = x - x**3/6 + x**5/120 - x**7/5040
# 
# label1 = "x - {x^3}/3!"
# label2 = "x - {x^3}/3! + {x^5}/5!"
# label3 = "x - {x^3}/3! + {x^5}/5! - {x^7}/7!"
# 
# #
# set termoption enhanced
# set encoding utf8
# #
# set title "Polynomial approximation of sin(x)"
# set key Left center top reverse
# set xrange [ -3.2 : 3.2 ]
# set xtics ("-π" -pi, "-π/2" -pi/2, 0, "π/2" pi/2, "π" pi)
# set format y "%.1f"
# set samples 500
# set style fill solid 0.4 noborder
# 
# plot '+' using 1:(sin($1)):(approx_1($1)) with filledcurve title label1 lt 3, \
#      '+' using 1:(sin($1)):(approx_2($1)) with filledcurve title label2 lt 2, \
#      '+' using 1:(sin($1)):(approx_3($1)) with filledcurve title label3 lt 1, \
#      sin(x) with lines lw 1 lc rgb "black"

gpl do
  run "approx_1(x) = x - x**3/6"
  run "approx_2(x) = x - x**3/6 + x**5/120"
  run "approx_3(x) = x - x**3/6 + x**5/120 - x**7/5040"
  run "label1 = \"x - {x^3}/3!\""
  run "label2 = \"x - {x^3}/3! + {x^5}/5!\""
  run "label3 = \"x - {x^3}/3! + {x^5}/5! - {x^7}/7!\""
  set :termoption, :enhanced
  set encoding:"utf8"
  set title:"Polynomial approximation of sin(x)"
  set :key, :Left, :center, :top, :reverse
  set xrange:-3.2..3.2
  set xtics:'("-π" -pi, "-π/2" -pi/2, 0, "π/2" pi/2, "π" pi)'
  set format_y:"%.1f"
  set samples:500
  set :style, fill_solid:0.4, noborder:true
  plot ["'+'", using:'1:(sin($1)):(approx_1($1))', with:"filledcurve", title_nq:'label1', lt:3],
    ["'+'", using:'1:(sin($1)):(approx_2($1))', with:"filledcurve", title_nq:'label2', lt:2],
    ["'+'", using:'1:(sin($1)):(approx_3($1))', with:"filledcurve", title_nq:'label3', lt:1],
    ["sin(x)", with:"lines", lw:1, lc_rgb:"black"]
end

