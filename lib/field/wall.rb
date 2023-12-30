require_relative 'cell'

# フィールドの外周を表すクラス
class Wall < Cell
  def initialize(x, y)
    super(x, y)
    @block_color = 94 # Brown
  end

  def has_block? = true
end
