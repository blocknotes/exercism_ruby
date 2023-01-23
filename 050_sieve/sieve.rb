class Sieve
  def initialize(number) = @number = number

  def primes
    @list = 2.upto(number).to_a
    2.upto(number) { |i| remove_multiples(i) }
    list
  end

  private

  attr_reader :list, :number

  def remove_multiples(i)
    n = i
    while n <= number
      n += i
      list.delete(n)
    end
  end
end
