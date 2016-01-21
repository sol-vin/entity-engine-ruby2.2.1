require_relative '../engine/component'
require_relative '../engine/dependencies'
class Render < Component
  extend Dependencies
  add_dependency :position

  def initialize(name, parent)
    super(name, parent)
  end
end