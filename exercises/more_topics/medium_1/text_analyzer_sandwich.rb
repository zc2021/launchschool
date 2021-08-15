class TextAnalyzer
  def process
    text = File.read('inputs/sandwich_code.txt').split("\n")
    yield text
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |lines|
  count = 1
  lines.each { |line| count += 1 if line.empty? }
  puts "#{count} paragraphs"
end
analyzer.process do |lines|
  count = 0
  lines.each { |line| count += 1 }
  puts "#{count} lines"
end
analyzer.process do |lines|
  count = 0
  lines.each { |line| count += line.split(' ').size }
  puts "#{count} words"
end