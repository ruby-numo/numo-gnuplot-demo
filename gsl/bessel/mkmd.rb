user = "ruby-numo"
repo = "numo-gnuplot-demo"
dir  = `git rev-parse --show-prefix`.chomp
fncs = %w[Jn Yn In Kn jl yl il kl]

open("README.md","w") do |f|
  f.puts "## Ruby script\n\n"
  Dir.glob("plot*.rb") do |src|
    f.puts "* #{dir}#{src}\n\n```ruby"
    f.puts IO.read(src)
    f.puts "```\n\n"
  end

  f.puts "## Result plot\n\n"
  fncs.each do |x|
    img = "bessel_#{x}.png"
    link = "https://raw.github.com/#{user}/#{repo}/master/#{dir}image/#{img}"
    f.puts "![#{img}](#{link})"
  end
end
