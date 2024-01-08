class Display
  Document = JS.global[:document]

  # フィールドの情報をもとに画面を描画する
  def draw(field, tetromino)
    # 画面をクリア
    clear
    # フィールドのブロック描画
    field.blocks.each { draw_block _1 }
    # テトリミノのブロック描画
    tetromino.blocks.each { draw_block _1 }
  end

  def close
    clear
  end

  private

  def clear
    Document.querySelectorAll('.cell').to_a.each do |cell|
      cell[:style][:backgroundColor] = 'white'
    end
  end

  # ブロックの描画
  def draw_block(block)
    row = Document.querySelector("[data-y='#{block.y}']")
    cell = row.querySelector("[data-x='#{block.x}']")
    cell[:style][:backgroundColor] = "#{block.color}"
  end
end
