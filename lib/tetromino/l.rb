require_relative 'base'

module Tetromino
  # L字型のテトリミノを表すクラス
  class L < Base
    def initialize(field)
      super field,
            :orange,
            [
              [0, 0, 0, 0],
              [1, 1, 1, 0],
              [1, 0, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
