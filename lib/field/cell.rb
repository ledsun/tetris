Block = Data.define(:color, :x, :y)

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

  def down_block(field)
    return unless @block

    field.down_cell_of(self).recieve_block_from(self)
  end

  def recieve_block_from(other)
    raise 'other cell has no block' unless other.block

    @block = Block.new(other.block.color, @x, @y)
    other.block = nil
  end

  def block=(block)
    raise "position is not match" unless match_position?(block)
    @block = block
  end

  private

  def match_position?(block)
    return true unless block
    block.x == @x && block.y == @y
  end
end
