module FlattenArray
  module_function

  def flatten(ary) = (ary || []).flatten.compact
end
