require "numo/gnuplot"

data= <<EOL
2016-07-19T23:47:53.432Z 33.2
2016-07-19T23:41:59.558Z 33.1
2016-07-19T23:36:06.183Z 32.9
2016-07-19T23:30:09.101Z 32.7
2016-07-19T23:24:15.936Z 32.6
2016-07-19T23:18:19.082Z 32.4
2016-07-19T23:12:20.944Z 32.4
2016-07-19T23:06:28.191Z 32.3
2016-07-19T23:00:35.459Z 31.6
2016-07-19T22:54:33.798Z 31.2
2016-07-19T22:48:31.436Z 30.7
2016-07-19T22:42:27.744Z 30.1
2016-07-19T22:36:30.776Z 29.7
2016-07-19T22:30:32.814Z 29.4
2016-07-19T22:24:38.774Z 28.8
2016-07-19T22:18:38.911Z 28.5
2016-07-19T22:12:45.805Z 28.2
2016-07-19T22:06:39.124Z 27.7
2016-07-19T22:00:39.920Z 27.1
2016-07-19T21:54:42.007Z 26.5
EOL

x,y = data.split(/\n/).map{|x| x.split}.transpose
y.map!{|i| i.to_f}

Numo.gnuplot do
  debug_on
  set ylabel: 'Temperature degree'
  set xlabel: "Time (starting at #{x[0]})"
  set xdata: "time"
  set timefmt_x: "'\"%Y-%m-%dT%H:%M:%SZ\"'"
  set format_x: '%H:%M'
  set :style, :data, "lines"
  #set 'terminal postscript color eps enhanced font "Helvetica,13" size 16cm,8cm'
  #set "output 'temperature-pcb.ps'"

  plot x,y,using:[1,2],with:"linespoints",lc_rgb:"black",lw:3,notitle:true
end

gets
