require_relative 'base'

module Tetorimino
  # テトリミノのTを表すクラス
  class T < Base
    def initialize(field)
      super field,
            6, # paleBlue
            [
              [0, 0, 0, 0],
              [1, 1, 1, 0],
              [0, 1, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
