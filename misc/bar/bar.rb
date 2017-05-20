require 'numo/gnuplot'

x = ['a','b','c','d']
y = [10,20,40,30]

Numo.gnuplot do
  debug_on
  set boxwidth:0.5
  set style:[fill:'solid']
  plot x,y, using:[2,'xtic(1)'], with:'boxes'
end

gets
