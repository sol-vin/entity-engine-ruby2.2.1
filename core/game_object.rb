module GameObject
  attr_reader :name
  attr_reader :id
  attr_reader :active, :visible
  attr_reader :initialized, :destroyed
  attr_reader :debug

  def initialize_object(name)
    @name = name
    @id = Game.get_id
    @active = false
    @visible = false
    @initialized = false
    @destroyed = false
    @debug = false
  end
end