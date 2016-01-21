require 'gosu'

class Game < Gosu::Window
  class << self
    attr_accessor :window

    def get_id
      @current_id ||= 0
      id = @current_id
      @current_id += 1
      id
    end
  end

  attr_reader :start_time
  attr_reader :last_time
  attr_reader :time
  attr_reader :steps
  attr_accessor :zoom
  attr_reader :states
  attr_accessor :current_state

  def initialize(width = 800, height = 600, full_screen = false)
    super width, height, full_screen
    Gosu::enable_undocumented_retrofication
    self.caption = "Entity Engine Game"
    @start_time = Time.now
    @time = 0
    @steps = 0
    @current_state = State.new('blank_state')
    @zoom = 1.0

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

  def delta_time
    time - last_time
  end
end