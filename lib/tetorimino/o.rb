module Tetorimino
  class O < Base
    def initialize(field)
      super field,
            Curses::COLOR_YELLOW,
            [
              [0, 0, 0, 0],
              [0, 1, 1, 0],
              [0, 1, 1, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
