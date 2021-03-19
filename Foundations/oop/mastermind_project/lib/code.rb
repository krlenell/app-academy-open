class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }
  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(chars)
    pegs = chars.split('')
    Code.new(pegs)
  end

  def initialize(chars)
    raise 'pegs invalid' unless Code.valid_pegs?(chars)

    @pegs = chars.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, i|
      count += 1 if @pegs[i] == peg
    end
    count
  end

  def num_near_matches(code)
    count = 0
    code.pegs.each do |peg|
      count += 1 if @pegs.include?(peg)
    end
    count - num_exact_matches(code)
  end

  def ==(other)
    length == num_exact_matches(other) && other.length == length
  end
end
