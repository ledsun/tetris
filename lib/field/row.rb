
# ゲームの盤面の一行を表すクラス
class Row
  include Enumerable

  attr_reader :is_in_field, :y

  def initialize(y, width)
    @y = y
    @cells = Array.new(width) do |x|
      if wall?(x, y)
        Wall.new(x, y)
      else
        Cell.new(x, y)
      end
    end
    @is_in_field = !wall?(1, y)
  end

  def filled?
    @cells.all? { |cell| cell.block }
  end

  def clear!
    in_field_cells.each { |cell| cell.block = nil }
  end

  def down_cells(field)
    in_field_cells.each { |cell| cell.down_block(field) }
  end

  def inspect
    "#{@y} #{@cells.map{ _1.block ? '■' : '□' }.join}"
  end

  def [](x) =@cells[x]
  def each = @cells.each { |cell| yield cell }

  private

  def in_field_cells = @cells.reject { |cell| cell.is_a? Wall }
  def wall?(x, y) = x == 0 || x == 11 || y == 0 || y == 21
end
