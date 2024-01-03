require_relative 'field/wall'
require_relative 'field/row'

# ゲームの盤面を表すクラス
class Field
  # 縦20マス、横10マス に壁を足したサイズ
  HEIGHT = 22
  WIDTH = 12

  def initialize
    @grid = Array.new(HEIGHT) { |y| Row.new(y, WIDTH) }
  end

  # フィールドのブロックを一つずつ処理します。
  def each_blocks
    each_cells do |cell|
      yield cell.block if cell.block
    end
  end

  def [](y, x)
    @grid[y][x]
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

    # インフィールド内のすべてのブロックを消した行分下にずらす
    # 下から順番にずらす
    # 上からずらすと、ずらしたブロックがずらす前のブロックと衝突してしまう
    in_field_blocks.reverse.each { |block| block.down filled_rows.size, self }
  end

  def nth_cell_down(n, cell)
    self[cell.y + n, cell.x]
  end

  def inspect
    @grid.map(&:inspect).join("\n")
  end

  private

  def each_cells
    @grid.each do |row|
      row.each do |cell|
        yield cell
      end
    end
  end

  def in_field_rows
    @grid.select { |row| row.is_in_field }
  end

  def in_field_cells
    in_field_rows.flat_map(&:in_field_cells)
  end

  def in_field_blocks
    in_field_cells.map(&:block).compact
  end
end
