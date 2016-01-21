require_relative '../engine/component'

class Health < Component
  attr_accessor :current, :max, :min

  def initialize(name, max = 100)
    @current = max
    @max = max
    @min = 0
  end

  def hurt(damage)
    @current -= damage
  end

  def heal(life)
    @current += life
    @current = @max if @current > @max
  end
end