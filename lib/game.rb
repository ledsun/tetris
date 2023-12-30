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

      # ゲームオーバーしていたらリスタートできる
      if game_over?
        restart if input == :restart
        next
      end

      # テトリミノを更新
      @tetorimino.update(input)

      # テトリミノが着地したら新しいテトリミノを生成
      if @tetorimino.landed?
        @tetorimino = Tetorimino.create(@field)
        # ゲームオーバー判定
        next game_over! if game_over?
      end

      # フィールドを描画
      @display.draw(@field, @tetorimino)

      # 1フレーム待つ
      sleep 1/60.0
    end

    @display.close
  end

  private

  # tetoriminoがフィールドの上部に到達したらゲームオーバー
  def game_over?
    @tetorimino.stacked?
  end

  # ゲームをもう一度始める
  def restart
    @field = Field.new
    @tetorimino = Tetorimino.create(@field)
    @display.draw(@field, @tetorimino)
  end

  # ゲームオーバー処理
  def game_over!
    @field.paint Curses::COLOR_WHITE
    @tetorimino.paint Curses::COLOR_WHITE
    @display.draw(@field, @tetorimino)
  end
end
