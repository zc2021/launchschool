items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, grain|
  puts produce.join(', ')
  puts grain
end

gather(items) do |fruit, *veg, grain|
  puts fruit
  puts veg.join(', ')
  puts grain
end

gather(items) do |fruit, *others|
  puts fruit
  puts others.join(', ')
end

gather(items) do |ap, co, ca, wh|
  puts "#{ap}, #{co}, #{ca}, and #{wh}"
end