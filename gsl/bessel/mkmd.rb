user = "ruby-numo"
repo = "numo-gnuplot-demo"
dir  = `git rev-parse --show-prefix`.chomp

open("README.md","w") do |f|
  f.puts "## Ruby script\n\n"
  Dir.glob("plot*.rb") do |src|
    f.puts "* #{dir}#{src}\n\n```ruby"
    f.puts IO.read(src)
    f.puts "```\n\n"
  end

  f.puts "## Result plot\n\n"
  Dir.glob("*.png") do |img|
    link = "https://raw.github.com/#{user}/#{repo}/master/#{dir}#{img}"
    f.puts "![#{img}](#{link})"
  end
end
