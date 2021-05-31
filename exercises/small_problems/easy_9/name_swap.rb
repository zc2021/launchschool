def swap_name(name)
  first, last = name.split(' ')[0], name.split(' ')[1]
  "#{last}, #{first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'