require_relative 'block'

# フィールドのセルを表すクラス
# セルにブロックがあると、四角を表示します。
# ブロックの色が指定できます。
class Cell
  attr_reader :x, :y, :block

  def initialize(x, y)
    @x = x
    @y = y
  end

  def paint(color)
    @block = Block.new(color, @x, @y)
  end

  def down(n, field)
    return unless @block

    move_to field.nth_cell_down(n, self)
  end

  def block=(block)
    raise "position is not match" unless match_position?(block)
    @block = block
  end

  def inspect
    if @block
      "#{x},#{y} ■"
    else
      "#{x},#{y} □"
    end
  end

  private

  def move_to(other)
    raise 'other cell has block' if other.block

    other.block = Block.new(@block.color, other.x, other.y)
    @block = nil
  end

  def match_position?(block)
    return true unless block
    block.x == @x && block.y == @y
  end
end
