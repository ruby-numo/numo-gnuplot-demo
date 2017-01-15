require 'pp'
KEY = %w[
  background
  cblabel
  clabel
  commentschars
  dashtype
  decimalsign
  fontpath
  format
  locale
  logfile
  missing
  name
  newhistogram
  output
  prefix
  print
  rgb
  separator
  table
  timefmt
  title
  x2label
  xlabel
  y2label
  ylabel
  zlabel
via
from
to
linestyle  ls
linetype   lt
linewidth  lw
linecolor  lc
pointtype  pt
pointsize  ps
pi
fill  fs
fc
fillstyle
pattern

at
norotate rotate by
font
noenhanced
front back
textcolor tc
point nopoint
offset
arc

from to rto
arrowstyle as
nohead head backhead heads
size
filled  empty nofilled

    angles            arrow             autoscale         bars
    bmargin           border            boxwidth          cbdata
    cbdtics           cblabel           cbmtics           cbrange
    cbtics            clabel            clip              cntrparam
    colorbox          contour           data              datafile
    date_specifiers   decimalsign       dgrid3d           dummy
    encoding          fit               fontpath          format
    function          grid              hidden3d          historysize
    isosamples        key               label             linetype
    lmargin           loadpath          locale            log
    logscale          macros            mapping           margin
    missing           mouse             multiplot         mx2tics
    mxtics            my2tics           mytics            mztics
    object            offsets           origin            output
    xxpalette           parametric        pm3d              pointintervalbox
    pointsize         polar             print             psdir
    rmargin           rrange            rtics             samples
    size              style             surface           table
    term              terminal          termoption        tics
    ticscale          ticslevel         time_specifiers   timefmt
    timestamp         title             tmargin           trange
    urange            view              vrange            x2data
    x2dtics           x2label           x2mtics           x2range
    x2tics            x2zeroaxis        xdata             xdtics
    xlabel            xmtics            xrange            xtics
    xyplane           xzeroaxis         y2data            y2dtics
    y2label           y2mtics           y2range           y2tics
    y2zeroaxis        ydata             ydtics            ylabel
    ymtics            yrange            ytics             yzeroaxis
    zdata             zdtics            zero              zeroaxis
    zlabel            zmtics            zrange            ztics
    zzeroaxis

    boxerrorbars      boxes             boxplot           boxxyerrorbars
    candlesticks      circles           dots              ellipses
    errorbars         errorlines        filledcurves      fillsteps
    financebars       fsteps            histeps           histograms
    image             impulses          labels            lines
    linespoints       lp                points            rgbalpha
    rgbimage          steps             vectors           xerrorbars
    xerrorlines       xyerrorbars       xyerrorlines      yerrorbars
    yerrorlines

      lines        dots       steps     errorbars     xerrorbar    xyerrorlines
      points       impulses   fsteps    errorlines    xerrorlines  yerrorbars
      linespoints  labels     histeps   financebars   xyerrorbars  yerrorlines

       boxes            candlesticks   image      circles
       boxerrorbars     filledcurves   rgbimage   ellipses
       boxxyerrorbars   histograms     rgbalpha   pm3d
       boxplot

    axes              binary            data
    datafile          errorbars         errorlines        every
    example           functions         index
    iteration         matrix            parametric
    ranges            smooth
    style             thru              title             unique
    using             volatile          with

layout

axis
border
mirror
in
out
scale
rotate
by
offset
format
font
textcolor

points
order
levels
discrete
incremental

first second graph screen character ratio
solid

palette
gamma
rgbformulae
defined
file
functions
cubehelix
model
maxcolors
start
cycles
saturation

format_x
format_x2
format_y
format_y2
format_xy
format_z
format_cb

title_offset
title_font
title_tc
title_textcolor

reverse
writeback
left right
top bottom
center
centre
behind
enhanced
bgnd
inside

whiskerbars
clustered
errorbars
gap
interpolate

on off default
inside   outside   lmargin   rmargin   tmargin   bmargin
left   right   center top   bottom   center
vertical   horizontal Left   Right
opaque
reverse
invert
samplen
spacing
width
height
autotitle
title
enhanced
font
textcolor
box
maxcols
maxrows

]


POST_KEY = %w[
first second graph screen character ratio
rgb
solid
by
]

PRE_KEY = %w[
format
point
tc
cubehelix
clustered
errorbars
]

NO_KEY = %w[
x
x2
y
y2
xy
z
mx2
mx
my2
my
mz
col
a
i j k
]

PLOT_KEY = %w[
    acsplines         axes              bezier            binary
    cnormal           csplines          cumulative        data
    datafile          errorbars         errorlines        every
    example           frequency         functions         index
    iteration         kdensity          matrix            parametric
    ranges            sbezier           smooth            special-filenames
    style             thru              title             unique
    using             volatile          with

      lines        dots       steps     errorbars     xerrorbar    xyerrorlines
      points       impulses   fsteps    errorlines    xerrorlines  yerrorbars
      linespoints  labels     histeps   financebars   xyerrorbars  yerrorlines

       boxes            candlesticks   image      circles
       boxerrorbars     filledcurves   rgbimage   ellipses
       boxxyerrorbars   histograms     rgbalpha   pm3d
       boxplot

linestyle  ls
linetype   lt
linewidth  lw
linecolor  lc
pointtype  pt
pointsize  ps
pi
fill  fs
fc
tc
font
]

def KEY.===(k)
  k = k.to_s
  if NO_KEY.include?(k)
    false
  elsif /^no([a-z_]\w*)$/ =~ k
    re = /^#{$1}/
    any?{|q| re =~ q}
  elsif /^[A-Za-z_]\w*$/ =~ k
    #k = $1 if /_([^_]+)$/ =~ k
    re = /^#{k}/
    #return false if NONEED_QUOTE.any?{|q| re =~ q}
    any?{|q| re =~ q}
  end
end

def PLOT_KEY.===(k)
  k = k.to_s
  if /^[A-Za-z_]\w*$/ =~ k
    re = /^#{k}/
    any?{|q| re =~ q}
  end
end

def fix_num(b)
  b.tr(' ','').sub(/^(-)?\./,'\10.').sub(/\.$/,'.0')
end


def paren(b,s)
  a = ""
  re = /(?<paren>\((?:[^()]|\g<paren>)*\))/
  while /^([^(]*)(\(.*)$/ =~ b
    f,b = $1,$2
    a += f
    b = b.sub(re){|x| s<<x; "_#{s.size}_"}
  end
  a += b
  a
end


def replace_quote(a)
  s = []
  b = a.gsub(/(?<!\\)"(.*?)(?<!\\)"/){ s<<$1; "\"_#{s.size}_\""}
  b.gsub!(/'([^']*)'/){ s<<$1; "'_#{s.size}_'"}
  b.gsub!(/(?<paren>\((?:[^()]|\g<paren>)*\))/){|x| s<<x[1..-2]; "(_#{s.size}_)"}

  b.gsub!(/\b(via|view) ([-\w.]*(,\s*[-\w.]*)*)/) do |x|
    k,v = $1,$2
    u = v.split(/,/).map{|y| y.strip}
    if u.all?{|y| /^[-\d.]+$/ =~ y}
      "#{k} #{u.join(',')}"
    else
      s << v
      "#{k} _#{s.size}_"
    end
  end

  b.gsub!(/\bvia\s+('[^']*'|"[^"]*")/) do
    "via #{$1.inspect}"
  end

  wd = '((graph|first|second|screen|rat\w*|char\w*) )?'
  item = wd+'[-\w.()]+(\s*[-+/*]\s*'+wd+'[-\w.()]+)*'
  b.gsub!(/\b(size|offset|at|from|to|disc\w*|incr\w*) (#{item}(\s*,\s*#{item})*)/){|x|
    k,v = $1,$2
    v = parse_array(v)
    case v
    when /^#{wd}[-\d.,]+$/
      "#{k} #{v}"
    else
      s<<v; "#{k} \"_#{s.size}_\""
    end
  }

  b.gsub!(/filledc\w*( (closed|above|below))?( (x1|x2|y1|y2|r|xy)(=[-\d.]+(,[-\d.]+)?)?)?/){|x|
    if $1 || $3
      s<<x; "_#{s.size}_"
    else
      x
    end
  }

  b.gsub!(/binary((\s+(\w+ ?= ?[^, ]+|flip\w|perp|transpose|'_\d_'|"_\d_"))+)/){|x|
    s << $1.strip.gsub(/'/, "\"")
    "binary _#{s.size}_"
  }

  [b,s]
end


def restore_quote(b,s)
  s.size.downto(1) do |i|
    b = b.sub(/_#{i}_/,s[i-1])
  end
  b
end


def sub_param(s)
  case s
  when /^[-\d.]+$/
    fix_num(s)
  when /^[-\d.,]+$/
    a = s.split(/,/)
    if a.any?{|x| x.empty?}
      s.inspect
    else
      "[#{a.map{|x| fix_num(x)}.join(',')}]"
    end
  when /^[-\d.:]+$/
    a = s.split(/:/)
    if a.any?{|x| x.empty?}
      s.inspect
    else
      "[#{a.map{|x| fix_num(x)}.join(',')}]"
    end
  when /^".*"|'.*'$/
    s
  else
    "'#{s}'"
  end
end


def parse_range(s)
  s.gsub(/\[([^\[\]]*)\]/) do |m|
    x = $1
    if /^\s*([-\d.]+)\s*:\s*([-\d.]+)\s*$/ =~ x
      b,e = $1,$2
      b = fix_num(b)
      e = fix_num(e)
      " #{b}..#{e}"
    else
      m.tr(' ','').inspect
    end
  end
end


def parse_array(s)
  s.gsub(/([-\d.]+\s*,\s*)+[-\d.]+/){|x|
    x.split(/\s*,\s*/).map{|y| fix_num(y)}.join(',')
  }
end


def trim_space(l)
  l.gsub(/\s+\+\s+/,'+').
    gsub(/\s+\-\s+/,'-').
    gsub(/\s+\*\s+/,'*').
    gsub(/\s+\/\s+/,'/').
    gsub(/\s*,\s+/,',')
end


def parse_param(l)
  a = parse_array(parse_range(trim_space(l))).split
  b = []
  i = 0
  while i < a.size
    case a[i]
    when /^t(i(t(le?)?)?)?$/        # title
      case a[i+1]
      when /^(".*")|('.*')$/
        b << a[i].to_sym
        b << a[i+1]
      when /^(offset|font|tc|textcolor)$/
        b << "#{a[i]}_#{a[i+1]}".to_sym
      else
        b << "#{a[i]}_nq".to_sym
        b << "'#{a[i+1]}'"
      end
      i += 2
    when KEY
      if KEY===a[i+1] &&
          ( POST_KEY.include?(a[i+1]) ||
            PRE_KEY.include?(a[i]) )
        b << "#{a[i]}_#{a[i+1]}".to_sym
        i += 2
      else
        b << a[i].to_sym
        i += 1
      end
    when /^[A-Za-z]\w*$/
      if b.last.kind_of? Array
        b.last << a[i]
      else
        b << [a[i]]
      end
      i += 1
    else
      b << sub_param(a[i])
      i += 1
    end
  end
  c = b.map{|x| (x.kind_of? Array) ? x.join(" ").inspect : x}
  d = []
  i = 0
  is_hash = false
  while i < c.size-1
    if c[i].kind_of?(Symbol)
      case c[i].to_s
      when /^w(i(th?)?)?$/            # with
        c1 = c[i+1]
        if /^(".*")|('.*')$/ !~ c1
          c1 = "\"#{c1}\""
        end
        d << "#{c[i]}:#{c1}"
        i += 1
        is_hash = true
      else
        case c[i+1]
        when Symbol
          if is_hash
            d << "#{c[i]}:true"
          else
            d << ":#{c[i]}"
          end
        else
          d << "#{c[i]}:#{c[i+1]}"
          i += 1
          is_hash = true
        end
      end
    else
      d << c[i]
      $stderr.puts "--invalid-- #{d.last} in #{c.inspect}" if is_hash
    end
    i += 1
  end
  if i < c.size
    if c[i].kind_of?(Symbol)
      if is_hash
        d << "#{c[i]}:true"
      else
        d << ":#{c[i]}"
      end
    else
      d << c[i]
      $stderr.puts "--invalid-- #{d.last} in #{c.inspect}" if is_hash
    end
  end
  d.join(", ")
end


def parse_set(a,b)
  case b
  when /^\w+$/
    return "#{a} :#{b}"
  when /^(style)\s+(line)\s+(\d+)\s+(.*)$/
    c,d,e,f = $1,$2,$3,$4
    "#{a} :#{c}, :#{d}, #{e}, #{parse_param(f)}"
  when /^(label)\s+(\d+)\s+(\S+)\s+(.*)$/
    c,d,e,f = $1,$2,$3,$4
    if KEY===e
      "#{a} :#{c}, #{d}, #{parse_param(e+' '+f)}"
    else
      if /^(".*"|'.*')$/ !~ e
        e =":'#{e}'"
      end
      "#{a} :#{c}, #{d}, #{e}, #{parse_param(f)}"
    end
  when /^(arrow|obj(ect)?|label)\s+(\d+)\s+(.*)$/
    c,d,e = $1,$3,$4
    "#{a} :#{c}, #{d}, #{parse_param(e)}"
  when /^format\s+(x|y|z|xy|x2|y2|cb)\s+(.*)$/
    c = "format_#{$1} #{$2}"
    "#{a} #{parse_param(c)}"

  when /^(arrow|style|xyplane|multiplot|key|cntrp\w*|pal\w*|fill)\s+(.+)$/
    c,d = $1,$2
    "#{a} :#{c}, #{parse_param(d)}"
  when /^((?:x|x2|y|y2|z)zeroaxis)\s+(.+)$/
    c,d = $1,$2
    "#{a} :#{c}, #{parse_param(d)}"

  when /^dummy\s+(.+)$/
    "#{a} dummy:#{$1.inspect}"

  when /^(for\b.+)$/
    "#{a} #{$1.inspect}"

  when /^(\w+)\s+(\w+)\s+(.+)$/
    c,d,e = $1,$2,$3
    if KEY===d
      "#{a} :#{c}, :#{d}, #{parse_param(e)}"
    else
      "#{a} :#{c}, #{parse_param(d+' '+e)}"
    end
  else
    "#{a} #{parse_param(b)}"
  end
end


def separate_plot_item(s)
  s = s.gsub(/\s+=\s+/,'=')
  s = s.strip
  s.scan(/\S+/) do |w|
    n = Regexp.last_match.offset(0)[0]
    #p [n,w,s] if /^\s*x\b/ =~ s
    if n > 0 && /^[A-Za-z_]\w*$/ =~ w
      re = /^#{w}/
      if PLOT_KEY.any?{|q| re =~ q || re =~ "no"+q }
        if n == 0
          return ['',s]
        else
          return [s[0..n-1],s[n..-1]]
        end
      end
    end
  end
  [s,'']
end


def parse_plot(c,d)
  r = ""
  while /^\s*(\[[^\[\]]*\])(.*)$/ =~ d
    b,d = $1,$2
    r += parse_range(b)+","
  end
  r += "\n    " if !r.empty?
  e = d.split(",")
  a = e.map do |x|
    #p x if /binary/ =~ x
    case x
    when /^\s*for\s+\[/
      x.strip.inspect
    else
      y,z = separate_plot_item(x)
      y = y.strip.gsub(/\s+/,' ')
      if y.empty?
        if z.strip.empty?
          nil
        else
          m = parse_param(z)
          if e.size > 1
            "[#{m}]"
          else
            m
          end
        end
      else
        k = y.inspect
        if z.strip.empty?
          k
        else
          if /\bu(s(i(ng?)?)?)?/ =~ z && /^(".*"|'.*')$/ !~ y
            k = ":#{k}"
          end
          m = parse_param(z)
          if e.size > 1
            "[#{k}, #{m}]"
          else
            "#{k}, #{m}"
          end
        end
      end
    end
  end
  "#{c} #{r}#{a.join(",\n    ")}"
end


GPL_CMD=%w[
 clear
 fit
 load
 quit
 reflesh
 reset
 show
 stats
 update
]

def parse(a)
  if /^\s*(\S+)(\s+(.*))?$/ =~ a
    cmd,args = $1,$3
    case cmd
    when /^rep(lot)?$/
      if args
        "replot #{args.inspect}"
      else
        "replot"
      end
    when /^s?plot$/
      parse_plot(cmd,args)
    when /^(un)?set$/
      parse_set(cmd,args)
    else
      if GPL_CMD.include?(cmd)
        if args
          "#{cmd} #{parse_param(args)}"
        else
          cmd
        end
      else
        nil
      end
    end
  else
    nil
  end
end


def convert(outfile,title)
  base = outfile[3..-1]
  lines = open("demo/#{base}.dem","r").each_line.to_a
  if /# .Id: / =~ lines[1]
    lines = lines[3..-1]
  end

  h = []
  g = [[],[]]
  plotted = false
  printing = false
  heredata = false
  multiplot = false
  table = false
  n_data = nil
  a = ""

  lines.each do |line|

    if /^\s*pause\b/ =~ line
      next
    end

    cmt = "# "+line
    if g[0].last != cmt
      g[0].push cmt
    end

    case line
    when /^\s*(#.*)$/
      line = ""
    when /^(.*)\\$/
      a += "#{$1} "
      next
    end

    a += line
    if a.strip.empty?
      next
    end

    if printing
      g[1].push a
      if /^\s*unset print\b/ =~ a
        g[1].push "EOL"
        printing = false
      end
      a = ""
      next
    end

    if heredata
      g[1].push a
      if /^e(nd)?/ =~ a
        n_data -= 1
        if n_data == 0
          g[1].push "EOL"
          heredata = false
        end
      end
      a = ""
      next
    end

    case a
    when /^\s*set print\b/
      printing = true
      g[1].push "  run <<EOL"
      g[1].push a
    when /^\s*\w+(\([\w,\s]+\))?\s*=.*$/
      g[1].push "  run #{a.strip.gsub(/\s+/,' ').inspect}"
    when /^\s*print\b/
    when /^\s*pause\b/
    else
      next if line.strip.empty?

      case a
      when /^\s*(plot|splot|replot|rep)\b/
        if !multiplot && !table
          plotted = true
        end
        if /("-"|'-') matrix/ =~ a
          n_data = 2
        else
          n_data = a.scan(/(plot|,)\s*("-"|'-')/).size
        end
      when /\bfile ("-"|'-')/
        n_data = 1
      else
        n_data = 0
      end
      if n_data > 0
        heredata = true
        g[1].push "  run <<EOL"
        g[1].push a
        a = ""
        next
      end

      case a
      when /^\s*set multiplot/
        multiplot = true
      when /^\s*unset multiplot/
        if multiplot
          plotted = true
        end
        multiplot = false
      when /^\s*set table\b/
        table = true
      when /^\s*unset table\b/
        table = false
      end

      a.gsub!(/\\'/,"'")
      a.gsub!(/\\`/,"'")

      b,s = replace_quote(a)
      b = b.gsub(/"\s*\.\s*"/,'"+"')
      if /^([^#]+\S)(\s*#.*)?$/ =~ b
        b,cmt = $1,$2
      else
        cmt = nil
      end
      b = b.split(";").map{|x| parse(x)}.compact
      if !b.empty? || cmt
        b = b.join("; ")
        b += cmt if cmt
        b = restore_quote(b,s)
        g[1].push "  "+b
      end
      if plotted
        h.push g
        g = [[],[]]
        plotted = false
      end
    end
    a = ""
  end

  if h.empty?
    h.push g
  else
    h.last.concat(g)
  end

  h.each do |g,r|
    while /^#( #)?\s+$/ =~ g.first
      g.shift
    end
    while /^#( #)?\s+$/ =~ g.last
      g.pop
    end
    r.map!{|x| x.sub(/^  set :time$/,"  #set :time")}
  end

  open("#{outfile}.rb","w") do |wt|
    wt.puts <<EOL
#
# #{title}
# http://gnuplot.sourceforge.net/demo_4.6/#{base}.html
require_relative \"gpl\"

EOL
    h.each do |g,r|
      g.each{|l| wt.puts(l)}
      wt.puts "\ngpl do"
      r.each{|l| wt.puts(l)}
      wt.puts "end"
      wt.puts
    end
  end

end


chap = -1
sect = 1
open("demo-html","r") do |f|
  f.each_line do |line|
    case line
    when /^\s*#/
      # skip
    when /<!--- /
      # skip
    when %r|<h4>|
      chap += 1
      sect = 1
    when %r|<li><a href="(.*)\.html">(.*)</a></li>|
      base,title = $1,$2
      title.gsub!(/&nbsp;/," ")
      outf = "%1d%02d%s" % [chap,sect,base]
      printf "%s \"%s\"\n", outf,title
      #raise if File.exist?("#{outf}.rb")
      convert outf,title
      sect += 1
    end
  end
end
