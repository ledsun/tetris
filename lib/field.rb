require_relative 'field/wall'

# ゲームの盤面を表すクラス
class Field
  # 縦20マス、横10マス に壁を足したサイズ
  HEIGHT = 22
  WIDTH = 12

  def initialize
    @grid = Array.new(HEIGHT) do |y|
      Array.new(WIDTH) do |x|
        if wall?(x, y)
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

  def [](y, x)
    @grid[y][x]
  end

  private

  def wall?(x, y)
    x == 0 || x == 11 || y == 0 || y == 21
  end
end