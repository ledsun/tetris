require_relative 'base'

module Tetorimino
  # テトリミノのTを表すクラス
  class T < Base
    def initialize(field)
      super field,
            :paleBlue,
            [
              [0, 0, 0, 0],
              [1, 1, 1, 0],
              [0, 1, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
