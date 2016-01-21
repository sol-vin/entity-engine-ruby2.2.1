require_relative './game_object'

class Entity
  include GameObject

  attr_reader :state
  attr_reader :components

  def initialize(name, state)
    @state = state
    @components = []

    state << self

    initialize_object(name)
  end

  def update
    components.each(&:update)
  end

  def draw
    components.each(&:draw)
  end

  def destroy(sender = nil)
    super sender
  end

  def << component
    @components << component
  end

  alias_method :add_component, :<<
end