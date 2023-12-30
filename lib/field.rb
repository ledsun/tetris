require_relative 'cell'

class Field
  attr_reader :grid

  def initialize
    @grid = Array.new(22) do |y|
      Array.new(12) do |x|
        if x == 0 || x == 11 || y == 0 || y == 21
          Cell.new(x, y, true)
        else
          Cell.new(x, y, false)
        end
      end
    end
  end

  def cell_at(x, y)
    @grid[y][x]
  end
end
