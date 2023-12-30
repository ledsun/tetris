class Cell
  attr_reader :x, :y, :color

  def initialize(x, y)
    @x = x
    @y = y
    @has_block = false
    @color = nil
  end

  def render?
    @has_block
  end

  def set_block(color)
    @has_block = true
    @color = color
  end

  def remove_block
    return unless @has_block

    @has_block = false
    @color = nil
  end
end
