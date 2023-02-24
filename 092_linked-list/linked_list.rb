class Node
  attr_accessor :next_node, :previous_node, :value

  def initialize(value, previous_node: nil, next_node: nil)
    @value = value
    @previous_node = previous_node
    @next_node = next_node
  end

  def to_s
    "<Node #{object_id}: " \
    "value: #{value}, next_node: #{next_node&.object_id}, previous_node: #{previous_node&.object_id}>"
  end
end

class Deque
  def initialize = @nodes = []

  def push(value)
    node = Node.new(value, previous_node: nodes.last)
    nodes.last&.next_node = node
    nodes << node
  end

  def pop
    return if nodes.empty?

    node = nodes.delete(nodes.last)
    nodes.last&.next_node = nil
    node.value
  end

  def shift
    return if nodes.empty?

    node = nodes.delete(nodes.first)
    nodes.first&.previous_node = nil
    node.value
  end

  def unshift(value)
    node = Node.new(value, next_node: nodes.first)
    nodes.first&.previous_node = node
    nodes.insert(0, node)
  end

  private

  attr_reader :nodes
end
