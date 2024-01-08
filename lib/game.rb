require_relative 'player_input'
require_relative 'field'
require_relative 'display'
require_relative 'tetromino'

class Game
  def initialize
    @player_input = PlayerInput.new
    @field = Field.new
    @display = Display.new
    @tetromino = Tetromino.create(@field)
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
      @tetromino.update(input)

      # テトリミノが着地したら
      if @tetromino.landed?
        # 行が揃ったら消す
        @field.clear_lines!
        # 新しいテトリミノを生成
        @tetromino = Tetromino.create(@field)
        # ゲームオーバー判定
        next game_over! if game_over?
      end

      # フィールドを描画
      @display.draw(@field, @tetromino)

      # 1フレーム待つ
      sleep 1/60.0
    end

    @display.close
  end

  private

  # tetrominoがフィールドの上部に到達したらゲームオーバー
  def game_over?
    @tetromino.stacked?
  end

  # ゲームをもう一度始める
  def restart
    @field = Field.new
    @tetromino = tetromino.create(@field)
    @display.draw(@field, @tetromino)
  end

  # ゲームオーバー処理
  def game_over!
    @field.bang_all_cells!
    @tetromino.bang!
    @display.draw(@field, @tetromino)
  end
end
