require_relative 'cell'

# フィールドの外周を表すクラス
class Wall < Cell
  def initialize(x, y, field)
    super(x, y, field)
    @block_color = :white
    @block = Block.new(@block_color, x, y, field)
  end

  def down(n, field) = nil
end
