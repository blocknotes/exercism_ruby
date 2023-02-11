class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(value) = @datum = value
end

class SimpleLinkedList
  def initialize(ary = [])
    @list = []
    ary.each { push(Element.new(_1)) }
  end

  def push(element)
    list.unshift(element)
    self
  end

  def pop = @list.shift

  def reverse!
    list.reverse!
    self
  end

  def to_a = list.map(&:datum)

  private

  attr_reader :list
end
