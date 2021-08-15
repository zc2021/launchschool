class DNA
  attr_reader :sequence

  def initialize(seq_string)
    @sequence = seq_string
  end

  def hamming_distance(other_dna)
    distance = 0
    compute_length = [self.length, other_dna.length].min
    0.upto(compute_length - 1) do |idx|
      distance += 1 unless sequence[idx] == other_dna[idx]
    end
    distance
  end

  def length
    sequence.length
  end
end