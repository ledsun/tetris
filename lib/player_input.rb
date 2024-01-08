class PlayerInput
  def initialize
    @buffer = []
    JS.global[:document].addEventListener('keydown') do
      @buffer << _1[:key]
    end
  end

  def from_key
    key = @buffer.shift
    case key.to_s
      when 'q' then :quit
      when 'r' then :restart
      when 'ArrowUp' then :rotate
      when 'ArrowLeft' then :left
      when 'ArrowRight' then :right
      when 'ArrowDown' then :down
    end
  end
end
