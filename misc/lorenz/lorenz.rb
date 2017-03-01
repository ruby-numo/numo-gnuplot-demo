require "numo/gnuplot"

def lorenz(x, y, z, s: 10, r: 28, b: 2.667)
  x_dot = s * (y - x)
  y_dot = r * x - y - x * z
  z_dot = x * y - b * z
  [x_dot, y_dot, z_dot]
end

dt = 0.01
stepCnt = 10_000

xs, ys, zs = [0.0], [1.0], [1.05]

stepCnt.times do |i|
  # Derivatives of the X, Y, Z state
  x_dot, y_dot, z_dot = lorenz(xs[i], ys[i], zs[i])
  xs[i + 1] = xs[i] + (x_dot * dt)
  ys[i + 1] = ys[i] + (y_dot * dt)
  zs[i + 1] = zs[i] + (z_dot * dt)
end

Numo.gnuplot do
  set term: "pngcairo", size:[600,600]
  set output: "lorenz.png"
  set xlabel: "X Axis"
  set ylabel: "Y Axis"
  set zlabel: "Z Axis"
  set title: "Lorenz Attractor"
  set grid: "xtics ytics ztics"
  set xyplane_at: 0
  unset :key

  set view: [60,30,1,1]
  splot xs, ys, zs, w:"lines", lw:0.5, lc_rgb:"blue"

  set term: "gif", animate:true, delay:50, size:[600,600]
  set output: "lorenz.gif"

  12.times do |i|
    set view: [80-i*5,10+i*15,1,1]
    splot xs, ys, zs, w:"lines", lw:1, lc_rgb:"blue"
  end
end
