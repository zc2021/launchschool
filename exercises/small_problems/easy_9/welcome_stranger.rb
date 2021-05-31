def prompt(msg)
  puts "=> #{msg}"
end

def greetings(name, job)
  full_name = name.join(' ')
  title = job[:title]
  role = job[:occupation]
  prompt("Hello, #{full_name}! Nice to have a #{title} #{role} around.")
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.