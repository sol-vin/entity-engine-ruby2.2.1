require_relative '../engine/entity'
require_relative '../components/position'
require_relative '../render/text_render'

class Label < Entity
  attr_reader :position
  attr_reader :text_render

  def initialize(name, state)
    @position = Position.new(:position, self)
    @text_render = TextRender.new(:text_render, self)
    super(name, state)
  end
end
