module Tetorimino
  class Base
    FRAMES_TO_FALL = 50

    def initialize(field, color, shape_map)
      @field = field
      @color = color
      @shape_map = shape_map
      @x = 4
      @y = 0
      @is_landed = false
      @fall_count = FRAMES_TO_FALL
    end

    # フレーム毎に呼び出される更新処理
    def update(input)
      rotate if input == :rotate
      fall unless @is_landed
    end

    # ブロックを返す
    def blocks
      shape_map_each do |block, x, y|
        yield Block.new(@color, @x + x, @y + y) if block == 1
      end
    end

    def landed? = @is_landed

    private

    def rotate
      before = @shape_map
      @shape_map = @shape_map.transpose.map(&:reverse)
      # 回転後に衝突したら回転を元に戻す
      if collision?
        @shape_map = before
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
      blocks { @field.add_block _1 }
    end

    # 衝突判定
    def collision?
      shape_map_each do |block, x, y|
        next if block == 0
        if @field[@y + y, @x + x].block
          return true
        end
      end
      false
    end

    # ブロックの形を表す配列をブロック毎に処理する
    def shape_map_each
      @shape_map.each_with_index do |row, y|
        row.each_with_index do |block, x|
          yield block, x, y
        end
      end
    end
  end
end
