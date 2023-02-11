class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data) = @data = data

  def insert(value) = node_insert(self, value)

  def each(&block) = block ? traverse(self, &block) : enum_for(:each)

  private

  def node_insert(node, value)
    if value <= node.data
      node.left ? node_insert(node.left, value) : (node.left = Bst.new(value))
    else
      node.right ? node_insert(node.right, value) : (node.right = Bst.new(value))
    end
  end

  def traverse(node, &block)
    traverse(node.left, &block) if node.left
    block.call(node.data)
    traverse(node.right, &block) if node.right
  end
end
