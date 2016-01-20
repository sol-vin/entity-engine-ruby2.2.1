require_relative './game_object'
require_relative './node'

class Entity < Node
  include GameObject
end