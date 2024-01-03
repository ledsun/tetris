require_relative 'block'

# フィールドのセルを表すクラス
# セルにブロックがあると、四角を表示します。
# ブロックの色が指定できます。
class Cell
  attr_reader :x, :y, :block

  def initialize(x, y, field)
    @x = x
    @y = y
    @field = field
  end

  # セルを塗りつぶします。
  # ゲームオーバー時に使います。
  def bang!
    @block = Block.new(:white, @x, @y, @field)
  end

  def down_block(n)
    return unless @block

    move_to @field[@y + n, @x]
  end

  def block=(block)
    raise "position is not match" unless match_position?(block)
    @block = block
  end

  def inspect
    if @block
      "#{x},#{y} ■"
    else
      "#{x},#{y} □"
    end
  end

  private

  def move_to(other)
    raise "Move block from #{self.inspect}. #{other.inspect} has block " if other.block

    other.block = Block.new(@block.color, other.x, other.y, @field)
    @block = nil
  end

  def match_position?(block)
    return true unless block
    block.x == @x && block.y == @y
  end
end
