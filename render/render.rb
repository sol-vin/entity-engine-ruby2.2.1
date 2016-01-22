require_relative '../engine/component'
require_relative '../engine/dependencies'
class Render < Component
  extend Dependencies
  add_dependency :position

  attr_accessor :layer
  attr_accessor :color
  attr_accessor :alpha
  attr_accessor :scale
  attr_accessor :offset_x, :offset_y
  attr_accessor :width, :height
  
  def initialize(name, parent)
    super(name, parent)
  end
end