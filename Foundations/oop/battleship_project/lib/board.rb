class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
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
    count = 0
    @grid.each do |arr|
      arr.each {|item| count += 1 if item == :S}
    end
    count
  end




end
