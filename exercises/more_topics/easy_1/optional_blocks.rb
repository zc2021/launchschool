def compute
  if self.block_given?
    yield
  else
    'Does not compute.'
  end
end

def compute_with_argument(arg)
  return 'Does not compute.' unless self.block_given?
  yield arg
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

p compute_with_argument(1) == 'Does not compute.'
p compute_with_argument(8) { |n| n * 2} == 16
p compute_with_argument('a') { |n| n.upcase } == 'A'