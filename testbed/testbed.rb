require_relative '../engine/engine'
require_relative '../gui/label'

class TestBedGame < Game
  class HelloWorldState < State
    def initialize(name)
      super name
      @hello_world = Label.new(:hello_world_text, self, 'Hello World', 40)
    end

    def update
      Game.window.caption = "Entity Engine Game #{Game.window.fps}"
      @hello_world.position.x += 0.1
      @hello_world.position.y += 0.1
    end
  end

  def initialize
    super
    HelloWorldState.new(:HelloWorldState).show
  end
end

TestBedGame.new.show