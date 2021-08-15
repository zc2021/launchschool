items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield items
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts "#{items.join(', ')}" }

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end