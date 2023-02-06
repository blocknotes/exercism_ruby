class WordProblem
  OPERATIONS = {
    'plus' => :sum,
    'minus' => :diff,
    'multiplied by' => :multiply,
    'divided by' => :divide
  }.freeze

  def initialize(question)
    @first_number, rest = question.scan(/What is (-{0,1}\d+)(.+)\?/).first
    @operations = rest&.scan(/ (plus|minus|multiplied by|divided by) (-{0,1}\d+)/)
  end

  def answer
    raise ArgumentError if !operations || operations.empty?

    operations.inject(first_number.to_i) do |result, (op, number)|
      send(OPERATIONS[op], result, number.to_i)
    end
  end

  private

  attr_reader :first_number, :operations

  def sum(number1, number2) = number1.to_i + number2.to_i

  def diff(number1, number2) = number1.to_i - number2.to_i

  def multiply(number1, number2) = number1.to_i * number2.to_i

  def divide(number1, number2) = number1.to_i / number2.to_i
end
