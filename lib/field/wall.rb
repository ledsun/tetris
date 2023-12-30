require_relative 'cell'

class Wall < Cell
  def initialize(x, y)
    super(x, y)
    @block_color = 94 # Brown
  end

  def has_block? = true
end
