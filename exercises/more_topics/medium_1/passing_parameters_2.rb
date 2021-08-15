birds = %w(raven finch hawk eagle)

def name_birds(array)
  yield array
end

name_birds(birds) { |_, _, *raptors| raptors.each { |r| puts r } }