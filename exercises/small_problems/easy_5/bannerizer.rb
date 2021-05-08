def print_in_box(string)
  width = string.length + 4
  l_pad = width.odd? ? (width / 2) + 1 : width / 2
  r_pad = width / 2 
  
  horizontal_border = "+".ljust(l_pad, padstr='-') + "+".rjust(r_pad, padstr='-')
  spacer = "|".ljust(l_pad) + "|".rjust(r_pad)
  banner_text = "| #{string} |"

  banner = "#{horizontal_border}\n#{spacer}\n#{banner_text}\n#{spacer}\n#{horizontal_border}"

  puts banner
end


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+