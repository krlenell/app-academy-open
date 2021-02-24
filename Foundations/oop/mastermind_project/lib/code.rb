class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs


  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    pegs = Array.new(length) {Code::POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(chars)
    pegs = chars.split('')
    Code.new(pegs)
  end

  def initialize(chars)
    raise "pegs invalid" if !Code.valid_pegs?(chars)
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
      if @pegs.include?(peg)
        count += 1
      end
    end
    count - self.num_exact_matches(code)
  end

  def ==(code)
    self.length == self.num_exact_matches(code) && code.length == self.length
  end
end
