class Nucleotide
  attr_reader :histogram

  def initialize(dna)
    raise ArgumentError unless /\A[ACGT]*\z/.match?(dna)

    counts = dna.split('').tally
    @histogram = { 'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0 }.merge(counts)
  end

  def count(nucleotide) = histogram[nucleotide]

  def self.from_dna(dna) = Nucleotide.new(dna)
end
