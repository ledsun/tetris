Block = Data.define(:color, :x, :y)

# フィールドのセルを表すクラス
# セルにブロックがあると、四角を表示します。
# ブロックの色が指定できます。
class Cell
  attr_accessor :block

  def initialize(x, y)
    @x = x
    @y = y
  end

  def paint(color)
    @block = Block.new(color, @x, @y)
  end
end
