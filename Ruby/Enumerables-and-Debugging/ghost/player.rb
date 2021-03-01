class Player

  def initialize(name)
    @name = name
  end

  attr_reader :name

  def guess(fragment)
    prompt(fragment)
    input = gets.chomp.downcase
  end

  def alert_invalid_guess(letter)
    puts "Your guess #{letter} is invalid"
    puts "It must be a letter and add to make a word"
    puts "Please type a new letter"
    puts "====================="
  end

  private

  def prompt(fragment)
    puts "The current letters are #{fragment}"
    puts "#{name}, what letter will you add?"
  end

end
