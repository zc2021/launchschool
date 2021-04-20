flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

counter = 0

loop do
  break if counter >= flintstones.size
  if flintstones[counter].include?('Be')
    puts counter
    break
  end
  counter += 1
end
