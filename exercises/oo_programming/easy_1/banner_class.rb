class Banner
  def initialize(message)
    @message = message
    @width = message.length ? message.length + 2 : 2
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :width

  def horizontal_rule
    '+' + ('-' * width) + '+'
  end

  def empty_line
    '|' + (' ' * width) + '|'
  end

  def message_line
    "| #{@message} |"
  end
end

banner_1 = Banner.new('To boldly go where no one has gone before.')
puts banner_1

banner_2 = Banner.new('')
puts banner_2