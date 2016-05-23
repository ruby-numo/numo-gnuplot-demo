user = "ruby-numo"
repo = "numo-gnuplot-demo"
dir  = `git rev-parse --show-prefix`.chomp

open("README.md","w") do |f|
  Dir.glob("plot*.rb") do |src|
    f.puts "## #{dir}\n\n```ruby"
    f.puts IO.read(src)
    f.puts "```\n\n"
  end

  Dir.glob("*.png") do |img|
    link = "https://raw.github.com/#{user}/#{repo}/master/#{dir}#{img}"
    f.puts "![#{img}](#{link})"
  end
end
