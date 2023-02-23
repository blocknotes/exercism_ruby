class CustomSet
  def initialize(ary) = @set = ary ? Array.new(ary.uniq) : Array.new([])

  def ==(other) = other ? (set - other.set) == (other.set - set) : false

  def add(item)
    set.<<(item) unless set.include?(item)
    self
  end

  def difference(other)
    @set = set.difference(other.set) if other
    self
  end

  def disjoint?(other) = other ? (set & other.set).empty? : true

  def empty? = set.empty?

  def intersection(other)
    @set = set.intersection(other.set) if other
    self
  end

  def member?(item) = set.member?(item)

  def subset?(other) = other ? (set & other.set) == set : false

  def union(other)
    @set = set.union(other.set) if other
    self
  end

  protected

  attr_reader :set
end
