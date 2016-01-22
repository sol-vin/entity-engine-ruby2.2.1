require_relative '../engine/service'

class Assets < Service

  attr_reader :assets

  def initialize(state)
    super state
    @assets = {}
  end

  def load_image(location, tag, options = {})
    @assets[tag] = Gosu::Image(location, options)
  end
end