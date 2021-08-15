def bubble_sort!(array, &block)
  compare = block_given? ? block.to_proc : :<=.to_proc
  loop do
    swapped = false
    1.upto(array.length - 1) do |idx|
      next if compare.call(array[idx - 1], array[idx])
      array[idx], array[idx - 1] = array[idx - 1], array[idx]
      swapped = true
    end
    break unless swapped
  end
  nil
end