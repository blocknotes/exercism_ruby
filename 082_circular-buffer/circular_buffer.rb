class CircularBuffer
  BufferEmptyException = Class.new(StandardError)
  BufferFullException = Class.new(StandardError)

  def initialize(s)
    @size = s
    clear
  end

  def read
    raise BufferEmptyException if buffer_empty?

    data = buffer[tail]
    buffer[tail] = nil
    advance_tail
    data
  end

  def write(data)
    raise BufferFullException if buffer_full?

    buffer[head] = data
    advance_head
  end

  def write!(data)
    overwriting = buffer_full?
    buffer[head] = data
    advance_head
    advance_tail if overwriting
  end

  def clear
    @buffer = Array.new(size)
    @tail = 0
    @head = 0
  end

  private

  attr_reader :buffer, :head, :size, :tail

  def advance_head = @head = (head + 1) % size

  def advance_tail = @tail = (tail + 1) % size

  def buffer_empty? = buffer[tail].nil?

  def buffer_full? = !buffer[head].nil?
end
