# Module for linking dependent objects together
module Dependencies
  # Instance methods to be included when Dependecies is extended
  module DependenciesInstance
    def self.included base
      puts "#{base} was included by #{self}"
    end
    # Hash of our objects links
    attr_reader :links

    # link the objects together
    def link(tag, dependency)
      @links ||= {}
      unless self.class.dependencies.include? tag
        raise ArgumentError.new("#{tag} was not found in class level dependencies!")
      end
      @links[tag] = dependency
    end

    # Has a dependency been met?
    def dependency_met? tag
      @links.include? tag
    end

    # Have all dependencies gotten met?
    def dependencies_met?
      self.class.dependencies.all? { |d| @links.include? d }
    end
  end

  # List of dependencies we need to fill for each object
  attr_reader :dependencies

  protected

  # initialize the dependencies list
  def self.extended(base)
    puts "#{base} was extended by #{self}"
    base.include DependenciesInstance
  end

  # Add a dependency to the list.
  def add_dependency(tag)
    @dependencies ||= []
    @dependencies << tag
  end
end