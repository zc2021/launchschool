hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.map do |_, chars|
  if chars[:type] == 'fruit'
    chars[:colors].map { |clr| clr.capitalize }
  else
    chars[:size].upcase
  end
end

p arr
puts arr == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]