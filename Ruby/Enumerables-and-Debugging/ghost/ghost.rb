require 'pry'
require 'set'
require_relative 'player'

class Ghost
  ALPHABET = Set.new("a".."z")


  def initialize(p1, p2)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @losses = 0
    @dictionary = Set.new(words)
    @fragment = ''
    @players = [p1, p2]
  end


  attr_reader :players, :dictionary, :fragment

  def current_player
    players.first
  end

  def previous_player
  end

  def next_player!
    players.rotate!
  end

  def valid_play?(letter)
    return false if string.length != 1
    return false unless ALPHABET.include?(string)

    check = fragment + letter
    dictionary.any? {|word| word.start_with?(check)}
  end

  def take_turn(player)

  end

  def is_word?(frag)
    dictionary.include?(frag)
  end

  def play_round
  end

end

# if __FILE__ == $PROGRAM_NAME
  $ghost = Ghost.new("p1", "p2")
# end
