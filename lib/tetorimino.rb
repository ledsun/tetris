require_relative 'tetorimino/i'
require_relative 'tetorimino/o'

module Tetorimino
  def self.create(field) = [I, O].sample.new(field)
end
