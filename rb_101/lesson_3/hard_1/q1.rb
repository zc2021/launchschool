if false
  greeting = "hello world"
end

greeting

# expect to throw an error; greeting is never initialized (if condition always evaluates to false)
# no error -> greeting is initialized to 'nil' (quirk of ruby)
