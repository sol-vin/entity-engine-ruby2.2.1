require_relative './game_object'

# Component class which hold reusable data.
class Component
  # Include out GameObject instance methods
  include GameObject

  # Parent entity
  attr_reader :parent

  def initialize(name, parent)
    @parent = parent

    # Add ourself to our parent
    parent << self

    # initialize this object
    initialize_object name
  end

  # Revives the object and puts it back in it's parent.
  def revive
    super
    parent << self
  end
end