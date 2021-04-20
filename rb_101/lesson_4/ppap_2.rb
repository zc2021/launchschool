ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

family_age = 0

ages.each do |person, age|
  family_age += age
end

puts family_age
