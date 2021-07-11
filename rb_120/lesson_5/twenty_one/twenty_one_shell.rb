module PrettyShell
  PROMPT = '=>'
  LOWER_PAD = 2

  def get_width
    `tput cols`.chomp.to_i
  end

  def get_height
    `tput lines`.chomp.to_i
  end
  
  def clear_screen
    system 'clear'
  end

  def line w=nil
    w = w || get_width
    '-' * w
  end

  def or_join arr, str
    return arr[0].to_s if arr.size == 1
    arr[0...-1].join(str) + "#{str}or #{arr[-1]}"
  end

  def and_join arr, str
    return arr[0].to_s if arr.size == 1
    arr[0...-1].join(str) + "#{str}and #{arr[-1]}"
  end

  def pretty_choice_syms arr
    or_join(arr.map(&:to_s), ', ')
  end

  def pretty_list_syms arr
    and_join(arr.map(&:to_s), ', ')
  end

  def pretty_print str
    puts "#{PROMPT} #{str}"
  end

  def print_border_line w
    puts "+#{'-' * (w - 2)}+"
  end

  def print_msg_line w, str, align: :center
    puts "|#{str.send align, (w - 2) }|"
  end

  def print_blank_line w
    print_msg_line w, ''
  end

  def print_line w=nil
    puts line(w)
  end

  def half_screen
    w = get_width - 2
    h = (get_height - 4 - LOWER_PAD) / 2
    print_border_line w
    h.times { |_| print_blank_line w }
    print_border_line w
  end

  def blank_screen
    clear_screen
    w = get_width - 2
    h = get_height - 2 - LOWER_PAD
    print_border_line w
    h.times { |_| print_blank_line w }
    print_border_line w
  end

  def msg_box w, h, *msgs, align: :center, clear: true
    clear_screen if clear
    msg_lines = (h - msgs.size).even? ? msgs.size : msgs.size + 1
    vert_pad = (h - msg_lines) / 2
    print_border_line w
    vert_pad.times { |_| print_blank_line w }
    msg_lines.times do |n| 
      msgs[n] ? print_msg_line(w, msgs[n], align: align) : print_blank_line(w)
    end
    vert_pad.times { |_| print_blank_line w }
    print_border_line w
  end

  def msg_screen *msgs, align: :center, clear: true
    w = get_width
    h = get_height - 2 - LOWER_PAD
    msg_box w, h, *msgs, align: align, clear: clear
  end
end