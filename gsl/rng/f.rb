f = eval(open("/home/masa/numo/gsl/ext/numo/gsl/ran/func_def.rb").read).
    select{|h| h[:func_name] =~ /^gsl_ran_(.*)$/}

f.each do |h|
  func_name = h[:func_name]
  name = func_name.sub(/^gsl_ran_/,"")
  args = h[:args]
  if args.shift[0] == "const gsl_rng *"
    unknown = false
    params = []
    args.each_with_index do |tn,i|
      if /^\w+$/ !~ tn[1] # pointer?
        unknown = true
        break
      end
      case tn[0]
      when "double"
        params << tn[1]
      when "unsigned int"
        params << tn[1]
      else
        unknown = true
        break
      end
    end
    if unknown
      #$stderr.puts "not defined: #{func_name} #{h[:args].inspect}"
      next
    end
    puts "[\"#{name}\",[#{params.join(",")}]],"
  end
end
