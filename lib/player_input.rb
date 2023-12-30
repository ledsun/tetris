require 'curses'

class PlayerInput
  def initialize
    # キー入力をエコー表示しない
    Curses.noecho
    # getchを非ブロッキングモードにする
    Curses.stdscr.nodelay = 1
     # カーソルを非表示にする
    Curses.curs_set(0)
  end

  def from_key
    case Curses.getch
    when 'q' then :quit
    end
  end
end
