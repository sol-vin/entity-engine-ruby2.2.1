require_relative '../engine/engine'
require_relative '../gui/label'

class TestBedGame < Game
  class HelloWorldState < State
    def initialize(name)
      super name
      @hello_world = Label.new(:hello_world_text, self, 'Hello World', 40)
      puts
    end
  end

  def initialize
    super
    @current_state = HelloWorldState.new(:HelloWorldState)
  end
end

TestBedGame.new.show