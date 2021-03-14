def execute(&block)
  block
end

execute {puts "Hello from inside the execute method!"}

#returns block proc object
#prints nothing to screen - block is not called
