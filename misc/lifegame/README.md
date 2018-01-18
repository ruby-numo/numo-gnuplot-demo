## Conway's Game of Life

[Description of this demo on jupyter notebook (iruby)](http://nbviewer.jupyter.org/github/icm7216/iruby-notebook-demo/blob/master/lifegame/lifegame_with_narray_convolution.ipynb) by [icm7216](https://github.com/icm7216) (in Japanese)

```ruby
require 'numo/narray'
require 'numo/gnuplot'

class LifeGame

  def initialize(nx,ny,m)
    @data = Numo::UInt8.zeros(ny,nx)
    @data[m..ny-1-m,m..nx-1-m] = Numo::UInt8.new(ny-2*m,nx-2*m).rand(2)
    @step = 0
  end

  def update
    b = Numo::UInt8.zeros(*@data.shape)
    b[1..-2,1..-2] =
      @data[0..-3,0..-3] + @data[0..-3,1..-2] + @data[0..-3,2..-1] +
      @data[1..-2,0..-3] + @data[1..-2,2..-1] +
      @data[2..-1,0..-3] + @data[2..-1,1..-2] + @data[2..-1,2..-1]
    @data.store((b.eq 3) | ((b.eq 2) & Numo::Bit.cast(@data)))
    @step += 1
  end

  attr_reader :data,:step
end

nx,ny = 200,200
life = LifeGame.new(nx,ny,1)

Numo.gnuplot do
  set output: "lifegame.gif"
  set term: "gif", animate:true, delay:10, size:[500,500]
  set :nokey
  set size: {ratio:1.0*ny/nx}
  set xrange: -1..nx
  set yrange: -1..ny
  unset :colorbox
  set palette_defined:'(0 "white", 1 "green")'

  101.times do |i|
    life.update if i > 0
    set title:"lifegame step=#{i}"
    plot life.data, with:"image"
  end
end
```
![008multiaxis/001](https://raw.github.com/ruby-numo/numo-gnuplot-demo/master/misc/lifegame/lifegame.gif)
