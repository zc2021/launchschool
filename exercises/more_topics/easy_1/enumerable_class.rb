class CheapTree
  include Enumerable

  def each
    # yield successive elements of the tree
  end

  # n.b. CheapTree elements must implement <=>
end

# lol they just wanted the cheap version, see below for partial notes on enumerable methods

class Tree
  def each
    # yields successive elements of the tree
  end

  def all?() { |el| block }
    # passes each element to the block, returns true if block returns a truthy value for every element
  end

  def any?() { |el| block }
    # passes each element to the block, returns true if block returns a truthy value for any element
  end

  def chain(*enums)
    # returns a new enumerator object created by concatenating calling and passed enumerators
  end

  def chunk { |el| block }
    # returns a new enumerator object grouping elements of the calling enumerator by return value of the block. 
    # consecutive elements with the same return value are grouped (along with the return value) like [val, [el, el,..]]
  end

  def chunk_while { |el_before, el_after| bool }
    # returns a new enumerator collecting chunks of the calling enumerator
    # the block compares el_before and el_after, returning a boolean. chunks are split where the block returns false
  end

  def collect { |obj| block }
    # returns a new array with the result of running the block (return value of block) once for each element
    # alias for map
  end

  def collect_concat { |obj| block }
    # returns a new array that is the concatenation of the return values of the block once for every element
    # alias for flat_map
  end

  def count(item) { |obj| block }
    # returns the number of items in calling enumerator (through enumeration)
    # if an argument is given, returns number of items == item (block, if passed, is not used)
    # if a block is given, counts the number of elements returning a true value from the block
  end

  def cycle(n=nil) { |obj| block }
    # calls block for each element of calling enumerabule n times (or forever if no argument is passed)
    # does nothing if n < 0 or calling enumerator is empty
    # returns nil if finished without interruption
    # n.b. elements are saved to an interal array - changes after first iteration do not effect #cycle
    # if no block is given, new enumerator is returned (the calling enumerator concatenated over n iterations)
  end

  def detect(ifnone=nil) { |obj| block }
    # passes each enumerable item to block and returns the first item for which block is not false
    # if no object matches, calls ifnone and returns the value (returns nil if no argument passed)
    # alias for find
  end

  def drop(n)
    # drops first n elements and returns remainder in new array
  end

  def drop_while { |obj| block }
    # drops elements up to but not including the first element for which the block returns nil or false
    # returns new array with remaining elements
  end

  def each_cons(n) { |obj| block }
    # executes block for each array of consecutive n elements in calling enumerator (returns nil)
    # n.b. obj is the n-element array (if block takes an argument) or its elements (if block takes multiple arguments)
    # if no block given, returns a new enumerator with each n elements chunked
  end

  def each_entry { |obj| block }
    # executes block once for each element of calling enumerator, converting multiple values from yield in to an array
    # if no block is given, an enumerator is returned
  end
end