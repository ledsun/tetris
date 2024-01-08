require_relative 'base'

module Tetromino
  # テトリミノのTを表すクラス
  class T < Base
    def initialize(field)
      super field,
            :purple,
            [
              [0, 0, 0, 0],
              [1, 1, 1, 0],
              [0, 1, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
