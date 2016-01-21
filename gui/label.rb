require_relative '../engine/entity'
require_relative '../components/position'
require_relative '../render/text_render'

class Label < Entity
  attr_reader :position
  attr_reader :text_render

  def initialize(name, state, text = "Label", height = 12)
    super(name, state)
    @position = Position.new(:position, self)
    @text_render = TextRender.new(:text_render, self, text, height)
    @text_render.link(:position, @position)
  end

  def text
    @text_render.text
  end

  def text= text
    @text_render.text = text
  end
end
