class Block
  attr_reader :color, :x, :y

  def initialize(color, x, y)
    @color = color
    @x = x
    @y = y
  end

  def down(n, field)
    cell = field[@y, @x]
    cell.down(n, field)
  end
end
