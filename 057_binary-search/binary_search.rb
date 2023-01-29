class BinarySearch
  def initialize(array) = @array = array.sort

  def search_for(key) = search(key, 0, array.size)

  private

  attr_reader :array

  def search(key, from, to)
    sub_array = array[from..to]
    return from if sub_array == [key]
    return if sub_array.size < 2

    half = (to - from) / 2
    key <= sub_array[half] ? search(key, from, from + half) : search(key, from + half + 1, to)
  end
end
