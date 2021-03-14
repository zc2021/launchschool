family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank", "rob", "david"],
           aunts: ["mary", "sally", "susan"]
}

immediate_family_rels = [:sisters, :brothers, :parents]

immediate_family = family.select {|key, value| value if immediate_family_rels.include? key}

p immediate_family.values.flatten
