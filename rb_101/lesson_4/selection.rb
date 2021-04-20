def select_fruit(produce)
  fruits = {}
  select_keys = produce.keys()
  counter = 0

  loop do
    break if counter >= select_keys.length
    current_key = select_keys[counter]
    fruits[current_key] = produce[current_key] if produce[current_key] == 'Fruit'
    counter += 1
  end

  fruits
end

def short_select_fruit(produce_hash)
  fruit = {}
  
  produce_hash.each_pair do |prod, category|
    fruit[prod] = category if category == 'Fruit'
  end
  
  fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
puts short_select_fruit(produce)
