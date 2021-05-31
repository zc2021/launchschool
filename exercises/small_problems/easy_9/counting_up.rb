def sequence(int)
  arr = []
  i = 0
  until i >= int
    arr[i] = i + 1
    i += 1
  end
  arr
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]