#
# 3D mapping
# http://gnuplot.sourceforge.net/demo_4.6/world2.html
require_relative "gpl"

# # Plot of location on globe, 
# # this time with labels color-coded by explicit 4th input column
# # Requires EAM_DATASTRINGS
# #
# set dummy u,v
# set angles degrees
# set parametric
# set view 60, 136, 1.22, 1.26
# set samples 64,64
# set isosamples 13,13
# set mapping spherical
# unset xtics
# unset ytics
# unset ztics
# set border 0
# set title "Labels colored by GeV plotted in spherical coordinate system"
# set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
# set vrange [ 0.00000 : 360.000 ] noreverse nowriteback
# set cblabel "GeV"
# set cbrange [0:8]
# set colorb vert user size 0.02, 0.75
# unset hidden
# splot cos(u)*cos(v),cos(u)*sin(v),sin(u) notitle with lines lt 5, \
#       'world.dat' notitle with lines lt 2, \
#       'srl.dat' using 3:2:(1):1:4 with labels notitle point pt 6 lw .1 left offset 1,0 font "Helvetica,7" tc pal

gpl do
  set dummy:"u,v"
  set angles:"degrees"
  set :parametric
  set view:[60,136,1.22,1.26]
  set samples:[64,64]
  set isosamples:[13,13]
  set mapping:"spherical"
  unset :xtics
  unset :ytics
  unset :ztics
  set border:0
  set title:"Labels colored by GeV plotted in spherical coordinate system"
  set urange:-90.0000..90.0000, noreverse:true, nowriteback:true
  set vrange:0.00000..360.000, noreverse:true, nowriteback:true
  set cblabel:"GeV"
  set cbrange:0..8
  set :colorb, :vert, "user", size:[0.02,0.75]
  unset :hidden
  splot "cos(u)*cos(v)",
    "cos(u)*sin(v)",
    ["sin(u)", :notitle, with:"lines", lt:5],
    ["'world.dat'", :notitle, with:"lines", lt:2],
    ["'srl.dat'", using:'3:2:(1):1:4', with:"labels", notitle:true, point_pt:6, lw:0.1, left:true, offset:1],
    ["0", font:"Helvetica,7", tc_pal:true]
end

# set title "Labels with hidden line removal"
# set hidden nooffset
# replot

gpl do
  set title:"Labels with hidden line removal"
  set :hidden, :nooffset
  replot
end

