require_relative 'base'

module Tetorimino
  # S字型のテトリミノを表すクラス
  class S < Base
    def initialize(field)
      super field,
            :green,
            [
              [0, 0, 0, 0],
              [0, 1, 1, 0],
              [1, 1, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
