require_relative './position'

class Body < Position
  extend Dependencies
  add_dependency :position

  attr_accessor :width, :height
end