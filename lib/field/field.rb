require_relative 'wall'

class Field
  HEIGHT = 22
  WIDTH = 12

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

  def cells
    @grid.each do |row|
      row.each do |cell|
        yield cell
      end
    end
  end
end
