
# ゲームの盤面の一行を表すクラス
class Row
  attr_reader :y, :cells, :is_in_field

  def initialize(y, width, field)
    @y = y
    @cells = Array.new(width) do |x|
      if wall?(x, y)
        Wall.new(x, y, field)
      else
        Cell.new(x, y, field)
      end
    end.freeze
    @is_in_field = !wall?(1, y)
  end

  # ブロックを返します。
  def blocks
    @cells.map(&:block).compact
  end

  # 一行すべてにブロックがあるかどうかを返します。
  # 行を消す判定に使います。
  def filled?
    @cells.all? { _1.block }
  end

  # 一行の壁以外のすべてのブロックを消します。
  def clear!
    in_field_cells.each { _1.block = nil }
  end

  # 一行の壁以外のすべてのセルを返します。
  def in_field_cells
    @cells.reject { _1.is_a? Wall }
  end

  # 指定位置のセルを返します。
  def [](x)
    @cells[x]
  end

  def inspect
    "%02d #{@cells.map{ _1.block ? '■' : '□' }.join}" % @y
  end

  private

  def wall?(x, y) = x == 0 || x == 11 || y == 0 || y == 21
end
