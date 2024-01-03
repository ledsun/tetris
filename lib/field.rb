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
    # フィールドの上から順番に行を見ていく
    in_field_rows.each do |row|
      # 行が揃っているかを判定する
      next unless row.filled?

      # 揃っていたらその行を消す
      row.clear!

      # 揃った行のひとつ上の行から昇順に、その行のブロックを下に落としていく
      @grid.slice(1, row.y).reverse_each do |upper_row|
        upper_row.down_cells self
      end
    end
  end

  def down_cell_of(cell)
    self[cell.y + 1, cell.x]
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
end
