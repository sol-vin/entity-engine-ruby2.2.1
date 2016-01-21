require_relative './game_object'

# Entity class which hold components and acts as a container
class Entity
  # include our GameObject instance methods
  include GameObject

  # Parent state
  attr_reader :state
  # List of components in this object
  attr_reader :components

  def initialize(name, state)
    @state = state
    @components = []

    # Add ourself to the state
    state << self

    # Initialize this object
    initialize_object(name)
  end

  def update
    components.each(&:update)
  end

  def draw
    components.each(&:draw)
  end

  # Revives an object and gives it back to it's parent
  def revive
    super
    state << self
  end

  # Add a component to this object.
  def << component
    @components << component
  end

  alias_method :add_component, :<<
end