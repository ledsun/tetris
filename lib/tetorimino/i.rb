require 'curses'
require_relative 'base'

module Tetorimino
  # I字型のテトリミノを表すクラス
  class I < Base
    def initialize(field)
      super field,
            :red,
            [
              [0, 0, 0, 0],
              [1, 1, 1, 1],
              [0, 0, 0, 0],
              [0, 0, 0, 0]
            ]
    end
  end
end
