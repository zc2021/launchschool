def buy_fruit(list)
  fruits = []
  list.each do |item|
    frt = item[0]
    item[1].times { |_| fruits << frt }
  end
  fruits
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]