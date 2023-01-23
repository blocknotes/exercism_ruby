class BoutiqueInventory
  def initialize(items)
    @items = items || []
  end

  def item_names
    items.map { _1[:name] }.sort
  end

  def cheap
    items.select { _1[:price].to_f < 30.0 }
  end

  def out_of_stock
    items.select { _1[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    result = items.find { _1[:name] == name }
    result ? result[:quantity_by_size] : nil
  end

  def total_stock
    items.sum { _1[:quantity_by_size].values.sum }
  end

  private

  attr_reader :items
end
