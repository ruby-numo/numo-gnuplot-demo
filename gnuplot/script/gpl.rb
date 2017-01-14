require "~/numo/gnuplot/lib/numo/gnuplot"
require "fileutils"

$term = ["pngcairo",font:"Nimbus Roman No9 L,12"]
$ext  = "png"
$base = "001"
$dir = File.basename($0,".rb")

def gpl(&blk)
  if $ext
    FileUtils.mkdir_p("../md/#{$dir}/image")
    Numo.gnuplot do
      set term:$term
      set output:"../md/#{$dir}/image/#{$base}.#{$ext}"
      instance_eval(&blk)
    end
    $base = $base.succ
  else
    Numo.gnuplot(&blk)
    print "Hit return to continue"
    gets
  end
end
