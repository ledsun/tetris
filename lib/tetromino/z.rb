require_relative 'base'

module Tetromino
  # Z字型のテトリミノを表すクラス
  class Z < Base
    def initialize(field)
      super field,
            :red,
            [
              [0, 0, 0, 0],
              [1, 1, 0, 0],
              [0, 1, 1, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
