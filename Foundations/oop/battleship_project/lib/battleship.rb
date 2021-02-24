require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    p "there are #{@board.num_ships} ships on the board"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      p 'you lose'
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships == 0
      p 'you win'
      true
    else
      false
    end
  end

  def game_over?
    win? || lose?
  end

  def turn
    pos = @player.get_move
    @remaining_misses -= 1 if !@board.attack(pos)
    puts "remaining misses: #{@remaining_misses}"
    @board.print
  end
end
