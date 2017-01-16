require 'numo/narray'
require 'numo/gnuplot'

class LifeGame

  def initialize(nx,ny,margin)
    @d = Numo::UInt8.zeros(ny,nx)
    m = margin
    @d[m..ny-1-m,m..nx-1-m] = Numo::UInt8.new(ny-2*m,nx-2*m).rand(2)
    @step = 0
    @gp = Numo::Gnuplot.new
    @gp.instance_eval do
      set output: "image/lifegame.gif"
      set term: "gif", animate:true, delay:10, size:[500,500]
      set :nokey
      set size: {ratio:1.0*ny/nx}
      set xrange: -1..nx
      set yrange: -1..ny
      unset :colorbox
      set palette_defined:'(0 "white", 1 "green")'
    end
    @gp.set title:"lifegame step=#{@step}"
    @gp.plot @d, with:"image"
  end

  def life_step
    b = Numo::UInt8.zeros(*@d.shape)
    b[1..-2,1..-2] =
      @d[0..-3,0..-3] + @d[0..-3,1..-2] + @d[0..-3,2..-1] +
      @d[1..-2,0..-3] + @d[1..-2,2..-1] +
      @d[2..-1,0..-3] + @d[2..-1,1..-2] + @d[2..-1,2..-1]
    @d.store((b.eq 3) | ((b.eq 2) & @d))
    @step += 1

    @gp.set title:"lifegame step=#{@step}"
    @gp.plot @d, with:"image"
  end

end

lifegame = LifeGame.new(200,200,1)
100.times{ lifegame.life_step }
