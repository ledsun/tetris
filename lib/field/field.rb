require_relative 'wall'

class Field
  HEIGHT = 22
  WIDTH = 12
  attr_reader :grid

  def initialize
    @grid = Array.new(HEIGHT) do |y|
      Array.new(WIDTH) do |x|
        if x == 0 || x == 11 || y == 0 || y == 21
          Wall.new(x, y)
        else
          Cell.new(x, y)
        end
      end
    end
  end

  def cell_at(x, y)
    @grid[y][x]
  end
end
