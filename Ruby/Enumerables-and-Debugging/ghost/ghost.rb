require 'pry'
require 'set'
require_relative 'player'

class Ghost
  ALPHABET = Set.new('a'..'z')

  def initialize(p1, p2)
    words = File.readlines('dictionary.txt').map(&:chomp)
    @losses = 0
    @dictionary = Set.new(words)
    @fragment = ''
    @players = [p1, p2]
  end

  def play_round
    # until word
    word = false
    until word
      take_turn
      word = true if is_word?(fragment)
      next_player!
    end
    puts "#{previous_player.name} made the word, #{fragment.upcase}"
    puts 'And loses'
    # should get guess from player
    # check if valid
    # check if word
    # change player if not
    # repeat
    # end game
  end

  # private

  attr_reader :players, :dictionary, :fragment

  def current_player
    players.first
  end

  def previous_player
    players.last
  end

  def next_player!
    players.rotate!
  end

  def add_letter(letter)
    fragment << letter
  end

  def valid_play?(letter)
    return false if letter.length != 1
    return false unless ALPHABET.include?(letter)

    check = fragment + letter
    dictionary.any? { |word| word.start_with?(check) }
  end

  def take_turn
    system('clear')
    letter = nil

    until letter
      letter = current_player.guess(fragment)
      unless valid_play?(letter)
        current_player.alert_invalid_guess(letter)
        letter = nil
      end
    end

    add_letter(letter)
    puts "#{current_player.name} added #{letter}."
  end

  def is_word?(frag)
    dictionary.include?(frag)
  end
end

# if __FILE__ == $PROGRAM_NAME
$ghost = Ghost.new(
  Player.new('Uzair'),
  Player.new('Cody')
)
# end
