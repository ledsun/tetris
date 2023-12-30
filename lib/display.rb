require 'curses'

class Display
  SQUARE = '■'

  def initialize
    Curses.init_screen
    Curses.start_color
    Curses.use_default_colors

    (0..255).each do |i|
      Curses.init_pair(i, i, -1)
    end
  end

  def draw(field)
    Curses.clear
    draw_field(field)
    Curses.refresh
  end

  def close
    Curses.close_screen
  end

  private

  def draw_field(field)
    field.cells { |cell| draw_block(cell) if cell.render? }
  end

  def draw_block(cell)
    Curses.setpos(cell.y, cell.x * 2)
    Curses.attrset(Curses.color_pair(cell.color))
    Curses.addstr(SQUARE)
  end
end
