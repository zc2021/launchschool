def count_occurrences(array)
  array.each_with_object(Hash.new(0)) do |item, hash|
    hash[item] += 1
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)
