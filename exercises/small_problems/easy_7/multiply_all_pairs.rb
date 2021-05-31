def multiply_all_pairs(arr_a, arr_b)
  unsorted_products = arr_a.map do |el_a|
    arr_b.map do |el_b|
      el_a * el_b
    end
  end
  unsorted_products.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]