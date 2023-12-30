require_relative 'player_input'
require_relative 'field'
require_relative 'display'
require_relative 'tetorimino'

class Game
  def initialize
    @player_input = PlayerInput.new
    @field = Field.new
    @display = Display.new
    @tetorimino = Tetorimino.create(@field)
  end

  def run
    # ゲームループ
    loop do
      # キー入力を取得
      input = @player_input.from_key

      # ゲーム終了
      break if input == :quit

      # テトリミノを更新
      @tetorimino.update(input)

      # フィールドを描画
      @display.draw(@field, @tetorimino)

      # 1フレーム待つ
      sleep 1/60.0
    end

    @display.close
  end
end
