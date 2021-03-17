class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](arr)
    row, column = arr
    @grid[row][column]
  end

  def []=(pos, val)
    row, column = pos
    @grid[row][column] = val
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p 'you sunk my battleship!'
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    max = 0.25 * size

    while num_ships < max
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      self[[row, col]] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |arr|
      arr.map do |el|
        if el == :S
          :N
        else
          el
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
