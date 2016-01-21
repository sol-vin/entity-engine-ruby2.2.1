module GameObject
  # Name of the object
  attr_reader :name
  # Id number of the object
  attr_reader :id
  # Should the object be updated/drawn?
  attr_reader :active, :visible
  # Has the object been initialized/destroyed?
  attr_reader :initialized, :destroyed
  # Is the object in debug mode
  attr_reader :debug

  #Aliases to make it look prettier
  alias_method :active?, :active
  alias_method :visible?, :visible
  alias_method :destroyed?, :destroyed

  #Initializes the object to a blank state
  def initialize_object(name)
    @name = name
    @id = Game.get_id
    @active = true
    @visible = true
    @initialized = true
    @destroyed = false
    @debug = false
  end

  def update

  end

  def draw

  end

  # Destroyes the object.
  def destroy
    @destroyed = true
  end

  # Revives an object
  def revive
    @destroyed = false
  end
end