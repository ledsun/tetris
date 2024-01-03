require_relative 'field/wall'
require_relative 'field/row'

# ゲームの盤面を表すクラス
class Field
  # 縦20マス、横10マス に壁を足したサイズ
  HEIGHT = 22
  WIDTH = 12

  def initialize
    @rows = Array.new(HEIGHT) { |y| Row.new(y, WIDTH) }
  end

  # フィールドのブロックを一つずつ処理します。
  def each_blocks
    each_cells do |cell|
      yield cell.block if cell.block
    end
  end

  def [](y, x)
    @rows[y][x]
  end

  def add_block(block)
    self[block.y, block.x].block = block
  end

  def paint(color)
    each_cells { |cell| cell.paint color }
  end

  def clear_lines!
    filled_rows = in_field_rows.select { |row| row.filled? }
    return if filled_rows.empty?

    # 埋まった行を消す
    filled_rows.each { |row| row.clear! }

    # 消した行より上の、インフィールド内のすべてのブロックを消した行分下にずらす
    # 下から順番にずらす
    # 上からずらすと、ずらしたブロックがずらす前のブロックと衝突してしまう
    y = filled_rows.last.y
    in_field_blocks(y).reverse.each { |block| block.down filled_rows.size, self }
  rescue => e
    raise "#{self.inspect}\n#{e.message}\n#{e.backtrace.join("\n")}"
  end

  def nth_cell_down(n, cell)
    self[cell.y + n, cell.x]
  end

  def inspect
    @rows.map(&:inspect).join("\n")
  end

  private

  def each_cells
    @rows.each do |row|
      row.each do |cell|
        yield cell
      end
    end
  end

  def in_field_rows
    @rows.select { |row| row.is_in_field }
  end

  def in_field_cells(y)
    in_field_rows.select { |row| row.y < y }.flat_map(&:in_field_cells)
  end

  def in_field_blocks(y)
    in_field_cells(y).map(&:block).compact
  end
end
