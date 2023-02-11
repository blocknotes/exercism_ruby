class Dominoes
  def chain?(dominoes)
    return true if dominoes.empty?

    dominoes.each_with_index.any? do |domino, index|
      traverse_chain(dominoes, domino, index).any? { domino[0] == _1[1] }
    end
  end

  def traverse_chain(dominoes, domino, index, results = [])
    return (results << dominoes.first) if dominoes.one?

    others = dominoes.dup
    others.delete_at(index)
    others.each_with_index do |dom, index2|
      traverse_chain(others, dom, index2, results) if dom[0] == domino[1]
      traverse_chain(others, dom.reverse, index2, results) if dom[1] == domino[1]
    end
    results
  end

  class << self
    def chain?(dominoes) = Dominoes.new.chain?(dominoes)
  end
end
