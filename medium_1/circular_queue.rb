class CircularQueue
  attr_accessor :circle_array

  def initialize(num_of_values)
    @circle_array = Array.new(num_of_values)
  end

  def dequeue
    if @circle_array.all?(nil)
      return nil
    end

    until @circle_array.first !=nil
      rotate_array
    end

    @circle_array << nil
    @circle_array.shift
  end

  def enqueue(value)
    if @circle_array.any?(nil)
      until @circle_array.first == nil
        rotate_array
      end
    end

    @circle_array << value
    @circle_array.shift
  end

  def rotate_array
    @circle_array = @circle_array[1..-1] + [@circle_array[0]]
  end
end

queue = CircularQueue.new(3)
p queue.circle_array
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