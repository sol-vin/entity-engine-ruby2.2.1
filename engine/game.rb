require 'gosu'

# Game window class, base of entity engine games
class Game < Gosu::Window
  class << self
    # Accessor to the current master window. Only one window can be open at a time.
    attr_accessor :window

    # Gets an id number for objects like State, Entity, and Component
    def get_id
      @current_id ||= 0
      id = @current_id
      @current_id += 1
      id
    end
  end

  # Time the game started
  attr_reader :start_time
  # The time it was last frame
  attr_reader :last_time
  # Current time
  attr_reader :time
  # How many steps have been run since the game started
  attr_reader :steps
  # Currently active state
  attr_accessor :current_state

  def initialize(width = 800, height = 600, full_screen = false)
    super width, height, full_screen
    Gosu::enable_undocumented_retrofication
    self.caption = "Entity Engine Game"
    @start_time = Time.now
    @time = 0
    @steps = 0
    self.class.window = self
  end

  #super must come at end of method for children
  def update
    @last_time = @time
    @time += Time.now - @start_time
    @steps += 1
    current_state.update
  end

  def draw
    current_state.draw
  end

  # Time between this frame and last frame
  def delta_time
    time - last_time
  end
end