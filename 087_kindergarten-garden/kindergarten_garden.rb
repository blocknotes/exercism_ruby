class Garden
  CHILDREN = %i[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry].freeze
  PLANTS = { 'C' => :clover, 'G' => :grass, 'R' => :radishes, 'V' => :violets }.freeze

  def initialize(plants)
    list = plants.scan(/[A-Z]{2}/)
    @plants = list.group_by.with_index { _2 % (list.size / 2) }
  end

  CHILDREN.each do |name|
    define_method(name) do
      i = CHILDREN.index(name)
      @plants[i].join.chars.map { PLANTS[_1] }
    end
  end
end
