def digit_finder num
  thousands = num.divmod(1000)[0]
  num = num.divmod(1000)[1]
  hundreds = num.divmod(100)[0]
  num = num.divmod(100)[1]
  tens = num.divmod(10)[0]
  num = num.divmod(10)[1]
  ones = num.divmod(10)[1]
  "1000s: #{thousands} \n 100s: #{hundreds} \n 10s: #{tens} \n 1s: #{num}"
end

puts digit_finder(1456)