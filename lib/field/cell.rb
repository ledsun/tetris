# フィールドのセルを表すクラス
# セルにブロックがあると、四角を表示します。
# ブロックの色が指定できます。
class Cell
  attr_reader :x, :y, :block_color

  def initialize(x, y)
    @x = x
    @y = y
  end

  def has_block? = false
end
