require_relative 'cell'

# フィールドの外周を表すクラス
class Wall < Cell
  def initialize(x, y, field)
    super(x, y, field)
    @block_color = 94 # Brown
    @block = Block.new(@block_color, x, y, field)
  end

  def down(n, field) = nil
end
