require 'fileutils'

RAW_BASE = "https://raw.githubusercontent.com/ruby-numo/gnuplot-demo/master/misc"

def put_code(f,base,img,code)
  f.puts <<EOL

### #{img.to_i}

```ruby
#{code.join}
```
![#{base}/#{img}](#{RAW_BASE}/#{base}/image/#{img}.png)
EOL
end

Dir.glob("image.rb").map.sort.each do |rb|
  base = File.basename(rb,".rb")
  list = []

  img = "001"
  gpl = false
  code = []
  r = open(rb,"rt")
  r.gets
  # title
  if /^#+(.*)$/ =~ r.gets
    title = $1.strip
  else
    title = base
  end
  # original url
  if /^#+(.*)$/ =~ r.gets
    url = $1.strip
  else
    url = nil
  end
  list << [base,title,url]

  while /^require_relative "gpl"/ !~ r.gets
  end

  open("README.md","wt") do |w|
    w.puts "## #{title}"
    w.puts "[Original Demo](#{url})" if url
    r.each do |line|
      case line
      when /^gpl do$/
        code << "\nNumo.gnuplot do\n"
      when /^end$/
        code << "end"
        put_code(w,base,img,code)
        gpl = false
        code = []
        img = img.succ
      else
        if !line.strip.empty?
          code << line
        end
      end
    end
  end
end
