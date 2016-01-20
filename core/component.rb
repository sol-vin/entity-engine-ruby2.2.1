require_relative './game_object'
require_relative './node'

class Component < Node
  include GameObject
end