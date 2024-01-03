
# ゲームの盤面の一行を表すクラス
class Row
  include Enumerable

  attr_reader :is_in_field, :y

  def initialize(y, width, field)
    @y = y
    @cells = Array.new(width) do |x|
      if wall?(x, y)
        Wall.new(x, y, field)
      else
        Cell.new(x, y, field)
      end
    end
    @is_in_field = !wall?(1, y)
  end

  def blocks
    @cells.map(&:block).compact
  end

  def filled?
    @cells.all? { |cell| cell.block }
  end

  def clear!
    in_field_cells.each { |cell| cell.block = nil }
  end

  def in_field_cells = @cells.reject { |cell| cell.is_a? Wall }

  def inspect
    "%02d #{@cells.map{ _1.block ? '■' : '□' }.join}" % @y
  end

  def [](x) =@cells[x]
  def each = @cells.each { |cell| yield cell }

  private

  def wall?(x, y) = x == 0 || x == 11 || y == 0 || y == 21
end
