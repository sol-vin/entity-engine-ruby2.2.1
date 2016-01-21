require_relative './game_object'

class Component
  include GameObject

  attr_reader :parent

  def initialize(name, parent)
    @parent = parent
    parent << self

    initialize_object name
  end
end