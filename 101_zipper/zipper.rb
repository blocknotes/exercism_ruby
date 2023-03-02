class Node
  attr_accessor :left, :right, :parent, :value

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
    left&.parent = self
    right&.parent = self
  end

  def ==(other) = value == other.value
end

class Zipper
  attr_reader :current, :tree

  alias to_tree tree

  def initialize(tree)
    @tree = tree
    @current = tree
  end

  def left = move_to(current.left)

  def right = move_to(current.right)

  def up = move_to(current.parent)

  def value = current&.value

  def set_value(val) = update_current_attr(:value, val)

  def set_left(node) = update_current_attr(:left, node)

  def set_right(node) = update_current_attr(:right, node)

  def ==(other) = current == other

  class << self
    def from_tree(tree) = Zipper.new(tree)
  end

  private

  def move_to(node)
    return unless node

    @current = node
    self
  end

  def update_current_attr(attr, val)
    current&.send("#{attr}=", val)
    self
  end
end
