require_relative './node'

class State < Node
  include GameObject

  attr_reader :services

  def initialize(name)
    @services = []
    initialize_object(name)
  end

  def update
    @services.each(&:update)
    super
  end

  def draw
    @services.each(&:draw)
    super
  end

  def add_service service
    @services << service
  end

  def get_service type
    @services
  end
end