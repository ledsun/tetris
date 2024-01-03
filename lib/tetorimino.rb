require_relative 'tetorimino/i'
require_relative 'tetorimino/o'
require_relative 'tetorimino/t'
require_relative 'tetorimino/j'
require_relative 'tetorimino/l'
require_relative 'tetorimino/s'

module Tetorimino
  def self.create(field) = [I, O, T, J, L, S].sample.new(field)
end
