require_relative 'cell'

class Wall < Cell
  def initialize(x, y)
    super(x, y)
    @color = 94 # Brown
  end

  def render? = true

  def set_block
    raise 'Cannot set block on wall'
  end

  def remove_block
    raise 'Cannot remove block from wall'
  end
end
