require_relative 'player_input'
require_relative 'field/field'
require_relative 'display'

class Game
  def initialize
    @player_input = PlayerInput.new
    @field = Field.new
    @display = Display.new
  end

  def run
    # ゲームループ
    loop do
      # キー入力を取得
      input = @player_input.from_key

      # ゲーム終了
      break if input == :quit
      puts input

      # フィールドを描画
      @display.draw(@field)

      # 1フレーム待つ
      sleep 1/60.0
    end

    @display.close
  end
end
