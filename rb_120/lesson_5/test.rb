

def calculate( *numbers, add: true )
  add ? add( *numbers ) : subtract( *numbers )
end

def add *numbers; numbers.reduce( 0, :+) end

def subtract n1, n2; n1 - n2 end

p calculate 1, 2 #=> 3
p calculate 3, 1, add: false #=> 2


