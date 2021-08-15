class Diamond
  class << self
    def make_diamond(apex, start='A')
      substrings = [start]
      spaces = 1
      char = start.next
      while char <= apex
        substrings << "#{char}#{' ' * spaces}#{char}"
        spaces += 2
        char = char.next
      end
      width = substrings.max.length
      substrings = substrings + substrings[0...-1].reverse
      substrings.map { |str| str.center(width) + "\n" }.join
    end
  end
end