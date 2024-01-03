require 'curses'

class Display
  # ブロックを表す文字
  SQUARE = '■'
  # 色一覧
  COLOR_MAP = {
    cyan: 14,
    blue: 20,
    orange: 208,
    yellow: Curses::COLOR_YELLOW,
    green: Curses::COLOR_GREEN,
    purple: 93,
    red: Curses::COLOR_RED,
    brown: 94,
    white: Curses::COLOR_WHITE
  }

  def initialize
    # cursesによる画面制御の開始
    Curses.init_screen
    # カラー処理を有効化
    Curses.start_color
    # 端末のデフォルトの前景色と背景色を使用するように設定
    Curses.use_default_colors
    # COLOR_MAPで使う色をすべて、cursesのカラーペアとして初期化する
    COLOR_MAP.values.each do |color|
      # 引数:1番目はペア番号、2番目は前景色、3番目は背景色(-1はデフォルトの背景色)
      Curses.init_pair(color, color, -1)
    end
  end

  # フィールドの情報をもとに画面を描画する
  def draw(field, tetorimino)
    # 画面をクリア
    Curses.clear
    # フィールドのブロック描画
    field.each_blocks { draw_block _1 }
    # テトリミノのブロック描画
    tetorimino.each_blocks { draw_block _1 }
    # 画面に変更を反映
    Curses.refresh
  end

  # cursesによる画面制御を終わる
  def close
    Curses.close_screen
  end

  private

  # ブロックの描画
  def draw_block(block)
    # カーソル位置を設定する
    # x軸の値をそのまま使うと詰まった様な印象の画面になるので2倍する
    Curses.setpos(block.y, block.x * 2)
    # カラーペアを適用する
    Curses.attrset(Curses.color_pair(COLOR_MAP[block.color]))
     # ブロックを描画する
    Curses.addstr(SQUARE)
  end
end
