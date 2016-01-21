require_relative './render'
require_relative '../engine/dependencies'

class TextRender < Render
  extend Dependencies
  add_dependency(:position)

  attr_accessor :text
  attr_accessor :font

  def initialize(name, parent, text = '', height = 12, font = 'Norasi')
    @font = Gosu::Font.new(height, name: font)
    @text = text
    super(name, parent)
  end

  def draw
    @font.draw(text, links[:position].x, links[:position].y, 1.0)
  end
end