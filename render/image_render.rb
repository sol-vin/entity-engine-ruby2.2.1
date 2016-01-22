require_relative './render'

class ImageRender < Render
  attr_reader :image

  def initialize(name, parent, asset_tag)
    super(name, parent)

    @image = parent.state.get_service(:Assets).assets[asset_tag]
  end

  def draw
    
  end
end