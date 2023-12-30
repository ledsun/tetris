require_relative 'player_input'
require_relative 'field'
require_relative 'display'

class Game
  def initialize
    @player_input = PlayerInput.new
    @field = Field.new
    @display = Display.new
  end

  def run
    loop do
      input = @player_input.from_key
      break if input == :quit
      puts input

      @display.draw(@field)

      sleep 0.016
    end

    @display.close
  end
end
