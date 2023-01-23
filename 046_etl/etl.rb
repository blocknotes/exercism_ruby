module ETL
  module_function

  def transform(source)
    scores = source.each_with_object([]) do |(score, letters), result|
      result.concat letters.map { [_1.downcase, score] }
    end
    scores.to_h
  end
end
