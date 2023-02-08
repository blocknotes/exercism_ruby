module ListOps
  module_function

  def arrays(ary) = ary.inject(0) { _1 + 1 }

  def reverser(ary) = (arrays(ary) - 1).downto(0).each_with_object([]) { |i, res| res << ary[i] }

  def concatter(ary1, ary2) = iterate(ary2).inject(ary1.dup) { _1 << ary2[_2] }

  def mapper(ary) = block_given? ? iterate(ary).each_with_object([]) { |i, res| res << yield(ary[i]) } : []

  def filterer(ary) = block_given? ? iterate(ary).each_with_object([]) { |i, res| res << ary[i] if yield(ary[i]) } : []

  def sum_reducer(ary) = iterate(ary).inject(0) { |res, i| res + ary[i] }

  def factorial_reducer(ary) = iterate(ary).inject(1) { |res, i| res * ary[i] }

  def iterate(ary) = 0.upto(arrays(ary) - 1)
end
