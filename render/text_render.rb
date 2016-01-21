require_relative './render'

class TextRender < Render
  attr_accessor :text
  attr_accessor :font

  def initialize(name, parent, height = 12, font = 'Norasi')
    @font = Gosu::Font.new(height, name: font)
    @text = ''
    super(name, parent)
  end

  def draw
    @font.draw(text, dependencies[:position].x, dependencies[:position].y, 1.0)
  end
end