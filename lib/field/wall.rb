require_relative 'cell'

# フィールドの外周を表すクラス
class Wall < Cell
  def initialize(x, y, field)
    super(x, y, field)
    @block_color = :brown
    @block = Block.new(@block_color, x, y, field)
  end
end
