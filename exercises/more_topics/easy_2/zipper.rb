def zip(arr_a, arr_b)
  arr_zip = []
  length = arr_a.length
  length.times { |idx| arr_zip << [arr_a[idx], arr_b[idx]] }
  arr_zip
end