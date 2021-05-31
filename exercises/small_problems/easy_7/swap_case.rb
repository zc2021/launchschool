def swapcase(string)
  swapped_chars = string.chars.map do |char|
    if %(ABCDEFGHIJKLMNOPQRSTUVWXYZ).include? char
      char.downcase
    elsif %(abcdefghijklmnopqrstuvwxyz).include? char
      char.upcase
    else
      char
    end
  end
  swapped_chars.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'