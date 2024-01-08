require_relative 'tetromino/i'
require_relative 'tetromino/o'
require_relative 'tetromino/t'
require_relative 'tetromino/j'
require_relative 'tetromino/l'
require_relative 'tetromino/s'
require_relative 'tetromino/z'

module Tetromino
  def self.create(field) = [I, O, T, J, L, S, Z].sample.new(field)
end
