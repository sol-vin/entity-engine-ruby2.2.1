# State class holds entities and services and attaches to a Game
class State
  # Include the GameObject instance methods
  include GameObject

  # The list of services on this State
  attr_reader :services
  # The list if entities on this State
  attr_reader :entities

  def initialize(name)
    @services = []
    @entities = []
    initialize_object(name)
  end

  def update
    @services.each(&:update)
    @entities.select{|e|e.active?}.each(&:update)
    @entities.delete_if {|e|e.destroyed?}
    super
  end

  def draw
    @services.each(&:draw)
    @entities.select{|e|e.visible?}.each(&:draw)
    super
  end

  # Add an entity to this State
  def << entity
    @entities << entity
  end
  alias_method :add_entity, :<<

  def add_service service
    @services << service
  end

  def get_service service_name
    @services.find {|s| s.class.to_s.to_sym == service_name}
  end

  def [] entity_name
    @entities.find {|e| e.name == entity_name}
  end

  def show
    Game.window.current_state = self
  end
end