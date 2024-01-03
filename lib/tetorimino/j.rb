require_relative 'base'

module Tetorimino
  # J字型のテトリミノを表すクラス
  class J < Base
    def initialize(field)
      super field,
            :blue,
            [
              [0, 0, 0, 0],
              [1, 1, 1, 0],
              [0, 0, 1, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
