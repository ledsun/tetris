require_relative 'field/wall'
require_relative 'field/row'

# ゲームの盤面を表すクラス
class Field
  # 縦20マス、横10マス に壁を足したサイズ
  HEIGHT = 22
  WIDTH = 12

  def initialize
    @rows = Array.new(HEIGHT) { |y| Row.new(y, WIDTH, self) }
  end

  # セルを取得します。
  def [](y, x)
    @rows[y][x]
  end

  # 壁を含むすべてのブロックを処理します。
  # ブロックを描画するときに使います。
  def each_blocks
    each_cells { yield _1.block if _1.block }
  end

  # セルにブロックを追加します。
  # テトリミノが着地したときに使います。
  # 追加するセルの位置は、ブロックの位置と同じです。
  def add_block(block)
    self[block.y, block.x].block = block
  end

  # すべてのセルを塗りつぶします。
  # ゲームオーバー時に使います。
  def bang_all_cells!
    each_cells { |cell| cell.bang! }
  end

  # 揃った行を消し、上の行を下にずらします。
  # テトリミノが着地したときに呼び出します。
  def clear_lines!
    filled_rows = in_field_rows.select { |row| row.filled? }
    return if filled_rows.empty?

    # 埋まった行を消す
    filled_rows.each { |row| row.clear! }

    # 消した行より上の、インフィールド内のすべてのブロックを消した行分下にずらす
    # 下から順番にずらす
    # 上からずらすと、ずらしたブロックがずらす前のブロックと衝突してしまう
    y = filled_rows.last.y
    in_field_blocks_over(y).reverse.each { _1.down filled_rows.size }
  rescue => e
    raise "#{self.inspect}\n#{e.message}\n#{e.backtrace.join("\n")}"
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
    @rows.select { _1.is_in_field }
  end

  def in_field_cells_over(y)
    in_field_rows.select { _1.y < y }.flat_map(&:in_field_cells)
  end

  def in_field_blocks_over(y)
    in_field_cells_over(y).map(&:block).compact
  end
end
