ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

old_fam = ages.select {  |person, age| age >= 100 }

p old_fam
