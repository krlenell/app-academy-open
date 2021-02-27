class Player

  def initialize(name)
    @name = name
  end

  def guess
    p "What is your next letter?"
    input = gets.chomp.downcase
  end

  def alert_invalid_guess(letter)
    p "Your guess #{letter} is invalid"
  end

end
