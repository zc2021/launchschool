def execute(&block)
  block.call
end

execute {puts "Hello from inside the execute method!"}

#returns nil? puts is called in block and puts returns nil
#prints "hello..." string; added .call method to block inside execute function
