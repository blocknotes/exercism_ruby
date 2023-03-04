module BookStore
  BOOK_PRICE = 8.0
  DISCOUNTS = [1.0 - 0, 1.0 - 0.05, 1.0 - 0.1, 1.0 - 0.2, 1.0 - 0.25].freeze

  def calculate_price(books)
    price_per_quantity = ->(quantity) { BOOK_PRICE * quantity * DISCOUNTS[quantity - 1] }
    counts = books.tally.sort { _2[1] <=> _1[1] }
    results = DISCOUNTS.size.downto(2).map do |i|
      group_by(counts, i).inject(0) { |total, quantity| total + price_per_quantity.call(quantity) }
    end
    results.min
  end

  def group_by(counts, group_size, groups = [])
    return groups if counts.empty?

    new_group_size = [group_size, counts.size].min
    groups << new_group_size
    new_group = counts.map { |k, _v| k }.first(new_group_size)
    new_counts = counts.map { |k, v| [k, new_group.include?(k) ? v - 1 : v] }
    new_counts = new_counts.reject { _2.zero? }.sort { _2[1] <=> _1[1] }

    group_by(new_counts, new_group_size, groups)
  end

  module_function :calculate_price, :group_by
end
