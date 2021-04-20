flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index do |person, index|
  flintstones_hash[person] = index
end

p flintstones_hash
