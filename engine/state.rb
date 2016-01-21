class State
  include GameObject

  attr_reader :services
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

  def << entity
    @entities << entity
  end

  alias_method :add_entity, :<<

  def add_service service
    @services << service
  end
end