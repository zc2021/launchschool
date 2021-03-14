#Hash.merge vs Hash.merge! (non-destructive vs destructive)

first_hash = {one: "one", two: "two"}
merge_to_me = {test: "solo"}

puts "First, our players: "
p first_hash
p merge_to_me

puts "Then, a merge: #{merge_to_me.merge(first_hash)}"
puts "What's this? #{merge_to_me} didn't change!"
puts "Let's try a merge!"
merge_to_me.merge!(first_hash)
p merge_to_me
