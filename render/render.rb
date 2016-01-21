require_relative '../engine/component'

class Render < Component
  include Dependencies
  add_dependency :position

  def initialize(name)
    super name
  end
end