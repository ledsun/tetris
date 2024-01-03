require_relative 'tetorimino/i'
require_relative 'tetorimino/o'
require_relative 'tetorimino/t'

module Tetorimino
  def self.create(field) = [I, O, T].sample.new(field)
end
