require_relative 'base'

module Tetromino
  class O < Base
    def initialize(field)
      super field,
            :yellow,
            [
              [0, 0, 0, 0],
              [0, 1, 1, 0],
              [0, 1, 1, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
