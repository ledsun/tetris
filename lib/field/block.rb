class Block
  attr_reader :color, :x, :y

  def initialize(color, x, y, field)
    @color = color
    @x = x
    @y = y
    @field = field
  end

  def down(n)
    cell = @field[@y, @x]
    cell.down_block(n)
  end
end
