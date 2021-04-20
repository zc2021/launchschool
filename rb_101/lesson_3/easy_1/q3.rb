# safer problem solution
advice = "Few things in life are as important as house training your pet dinosaur."
better_advice = advice.gsub("important","urgent")

# literal problem solution
advice2 = "Few things in life are as important as house training your pet dinosaur."
advice2.gsub!("important", "urgent")

puts better_advice
