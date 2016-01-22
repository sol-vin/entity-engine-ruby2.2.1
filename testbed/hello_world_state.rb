require_relative '../engine/engine'
require_relative '../gui/label'

class HelloWorldGame < Game
  class HelloWorldState < State
    class HelloWorldEntity < Label
      def initialize(parent)
        super(:hello_world_text, parent, 'Hello World', 40)
      end

      def update
        position.x += 0.2
        position.y += 0.2
      end
    end

    def initialize
      super :HelloWorldGame
      @spawn_time = 0
    end

    def update
      Game.window.caption = "Entity Engine Game objects: #{self.entities.count} fps: #{Game.window.fps}"
      @spawn_time += Game.window.delta_time
      if @spawn_time > 1
        HelloWorldEntity.new(self)
        @spawn_time = 0
      end
      super
    end
  end

  def initialize
    super
    HelloWorldState.new.show
  end
end

HelloWorldGame.new.show