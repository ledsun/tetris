require_relative 'tetorimino/i'
require_relative 'tetorimino/o'
require_relative 'tetorimino/t'
require_relative 'tetorimino/j'

module Tetorimino
  def self.create(field) = [I, O, T, J].sample.new(field)
end
