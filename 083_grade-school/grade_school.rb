class School
  def initialize = @students = {}

  def add(name, grade)
    return false if students.key?(name)

    students[name] = grade
    true
  end

  def grade(g) = students.select { |_name, grade| grade == g }.keys.sort

  def roster
    list = students.sort do |(name1, grade1), (name2, grade2)|
      compare_grade = grade1 <=> grade2
      compare_grade.zero? ? name1 <=> name2 : compare_grade
    end
    list.map { _1[0] }
  end

  private

  attr_reader :students
end
