class InvalidCodonError < ArgumentError; end

module Translation
  module_function

  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan'
  }.freeze

  def of_rna(strand)
    end_sequence = false
    result = strand.scan(/.{3}/).filter_map do |codon|
      end_sequence ||= stop_codon?(codon)
      next if end_sequence

      CODONS[codon] || raise(InvalidCodonError)
    end
    raise InvalidCodonError if !end_sequence && (strand.size % 3) != 0

    result
  end

  def stop_codon?(codon) = %w[UAA UAG UGA].include?(codon)
end
