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
end
