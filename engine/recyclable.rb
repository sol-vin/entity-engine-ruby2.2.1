
# Recyclable allows an object to be recycled through an object pool
# This allows faster object instance times and can ensure that the
# game runs smoother.
# Recyclable extends a class.
module Recyclable
  # Instance methods for Recyclable
  module RecyclableInstance
    # Is this object recycled?
    attr_reader :recycled
    alias_method :recycled?, :recycled

    # Resets this object to a template
    def reset(template)
      self.class.reset(self, template)
      revive
    end
  end

  attr_reader :templates
  attr_reader :object_pool
  attr_accessor :max_objects

  def self.extended base
    base.include RecyclableInstance
    base.max_objects = 20
  end

  def make_template key, &block
    @templates ||= {}
    @templates[key] = block
  end

  def get_recycled(template)
    @object_pool ||= []
    object = @object_pool.pop
    reset(object, template)
    object.revive(parent)
    object
  end

  def reset(object, template)
    object.instance_exec &@templates[template]
  end

  def recycle(object)
    object.destroy
    @object_pool << object
  end
end