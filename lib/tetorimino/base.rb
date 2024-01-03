module Tetorimino
  class Base
    FRAMES_TO_FALL = 50

    # shape_map: ブロックの形を表す2次元配列
    # 0: ブロックなし
    # 1: ブロックあり
    # 例: O字形テトリミノをあらわす配列
    #  [
    #    [0, 0, 0, 0],
    #    [0, 1, 1, 0],
    #    [0, 1, 1, 0],
    #    [0, 0, 0, 0]
    #  ]
    def initialize(field, color, shape_map)
      @field = field
      @color = color
      @shape_map = shape_map
      @x = 4
      @y = 0
      @is_landed = false
      @fall_count = FRAMES_TO_FALL
      @stacked = collision?
    end

    # フレーム毎に呼び出される更新処理
    def update(input)
      rotate if input == :rotate
      go_left if input == :left
      go_right if input == :right
      go_down if input == :down
      fall unless @is_landed
    end

    # ブロック毎に処理を行う
    def each_blocks
      each_shape_map do |block_flag, x, y|
        yield Block.new(@color, @x + x, @y + y, @field) if block_flag == 1
      end
    end

    # ブロックを塗りつぶします。
    # ゲームオーバー時に使います。
    def bang!
      @color = :white
    end

    def landed? = @is_landed
    def stacked? = @stacked

    private

    def rotate
      before = @shape_map
      @shape_map = @shape_map.transpose.map(&:reverse)
      # 回転後に衝突したら回転を元に戻す
      if collision?
        @shape_map = before
      end
    end

    def go_right
      @x += 1
      if collision?
        @x -= 1
      end
    end

    def go_left
      @x -= 1
      if collision?
        @x += 1
      end
    end

    def go_down
      @y += 1
      if collision?
        @y -= 1
        landing
      end
    end

    # 落下処理
    # 50フレームに1回落下する
    # 衝突したら着地する
    def fall
      @fall_count -= 1
      if @fall_count == 0
        @fall_count = FRAMES_TO_FALL
        @y += 1
        if collision?
          @y -= 1
          landing
        end
      end
    end

    # 着地処理
    # 着地したらフィールドに自身のブロックを追加する
    def landing
      @is_landed = true
      each_blocks { @field.add_block _1 }
    end

    # 衝突判定
    def collision?
      each_shape_map do |block_flag, x, y|
        next if block_flag == 0
        if @field[@y + y, @x + x].block
          return true
        end
      end
      false
    end

    # ブロックの形を表す配列をブロック毎に処理する
    # ブロックがある場所には1が、ない場所には0が入っている
    def each_shape_map
      @shape_map.each_with_index do |row, y|
        row.each_with_index do |block_flag, x|
          yield block_flag, x, y
        end
      end
    end
  end
end
