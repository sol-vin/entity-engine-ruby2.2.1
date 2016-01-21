module Dependencies
  module DependenciesInstance
    attr_reader :dependencies

    def included base
      @dependencies = {}
    end

    def fill_dependency(tag, dependency)
      unless self.class.dependencies.include? tag
        raise ArgumentError.new("#{tag} was not found in class level dependencies!")
      end
      @dependencies[tag] = dependency
    end

    def dependency_met? tag
      @dependencies.include? tag
    end

    def dependencies_met?
      self.class.dependencies.all? { |d| @dependencies.include? d }
    end
  end

  include DependenciesInstance

  attr_reader :dependencies

  protected

  def extended(base)
    @dependencies = []
    super base
  end

  def add_dependency(tag)
    @dependencies << tag
  end
end