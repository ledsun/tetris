class Cell
  attr_reader :x, :y, :is_wall, :has_block, :color

  def initialize(x, y, is_wall)
    @x = x
    @y = y
    @is_wall = is_wall
    @has_block = is_wall

    if is_wall
      @color = 94
    else
      @color = 1
    end
  end

  def set_block(color)
    return if @is_wall

    @has_block = true
    @color = color
  end

  def remove_block
    return unless @has_block

    @has_block = false
    @color = Curses::COLOR_BLACK
  end
end
