trash_hash = {hostess: "alice", thing: "podcast", genre: "future"}

trash_hash.each_key {|key| puts key}
trash_hash.each_value {|value| puts value}
trash_hash.each_pair {|key, value| puts "#{key}: #{value}"}
