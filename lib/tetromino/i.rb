require_relative 'base'

module Tetromino
  # I字型のテトリミノを表すクラス
  class I < Base
    def initialize(field)
      super field,
            :cyan,
            [
              [0, 0, 0, 0],
              [1, 1, 1, 1],
              [0, 0, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
