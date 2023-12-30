require 'curses'

class PlayerInput
  def initialize
    Curses.noecho
    Curses.stdscr.nodelay = 1
    Curses.curs_set(0)
  end

  def from_key
    case Curses.getch
    when 'q' then :quit
    end
  end
end
