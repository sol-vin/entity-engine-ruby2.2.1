require_relative './game.rb'

class Node
  attr_reader :parent
  attr_reader :children

  def initialize(name, parent = nil)
    @parent = parent
    @children = {}

    #bind our node with the parent
    parent.add_child(self) unless parent.nil?
  end

  def is_root?
    parent.nil?
  end

  def add_child child
    @children[child.name] = child
  end

  def remove_child name
    @children[name] = nil
  end

  def [] child_name
    @children[child_name]
  end

  #finds the controlling state by climbing up the chain.
  def get_state
    return parent.get_root unless is_root?
    self
  end
end