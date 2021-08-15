class CircularQueue
  attr_reader :length

  def initialize length
    @next_position = 0
    @item_num = 0
    @length = length
    make_buffer length
  end

  def enqueue item
    add_item item
    advance_position
  end

  def dequeue
    if oldest_item
      item = oldest_item
      position = buffer.key oldest_item
      buffer[position] = nil
      return item.object
    end
    nil
  end
  
  private
  
  attr_accessor :next_position, :item_num, :buffer
  
  def make_buffer length
    @buffer = {}
    length.times do |n|
      buffer[n] = nil
    end
  end

  def full?
    buffer.values.all? { |v| v != nil }
  end
  
  def add_item item
    buffer[next_position] = QueueItem.new item, item_num
    self.item_num += 1
  end

  def oldest_item
    buffer.values.reject(&:nil?).min do |a, b|
      a.num <=> b.num
    end
  end

  def replace_item position, new_item
    buffer[position] = new_item
  end

  def advance_position
    if self.full?
      self.next_position = buffer.key oldest_item
    else
      self.next_position = next_position + 1 >= length ? 0 : next_position + 1
    end
  end
end

class QueueItem
  attr_reader :object, :num

  def initialize obj, item_num
    @object = obj
    @num = item_num
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil