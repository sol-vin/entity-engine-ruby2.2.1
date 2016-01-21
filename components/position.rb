require_relative '../engine/component'

class Position < Component
  attr_accessor :x, :y
  attr_reader :last_x, :last_y

  def initialize(name, parent, x = 0, y = 0)
    @x = x
    @y = y
  end

  def x= x
    @last_x = @x
    @x = x
  end

  def y= y
    @last_y = @y
    @y = y
  end
end