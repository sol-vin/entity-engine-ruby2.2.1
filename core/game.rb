require 'gosu'

class Game < Gosu::Window
  class << self
    def get_id
      @current_id ||= 0
      id = @current_id
      @current_id += 1
      id
    end
  end

  attr_reader :start_time
  attr_reader :time
  attr_reader :steps
  attr_accessor :zoom
  attr_reader :states

  def initialize(width = 800, height = 600, full_screen = false)
    super width, height, full_screen
    Gosu::enable_undocumented_retrofication
    self.caption = "Entity Engine Game"
    @start_time = Time.now
    @time = 0
    @steps = 0

    @states = []
  end

  #super must come at end of method for children
  def update
    @time += Time.now - @start_time
    @steps += 1
    @states.each do |state|
      state.update
    end
  end

  def draw
    @states.each do |state|
      state.draw
    end
  end
end