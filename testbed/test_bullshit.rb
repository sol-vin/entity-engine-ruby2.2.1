module InstanceMethods
  attr_reader :test_value

  def initialize_object(test_value)
    @test_value = test_value
  end
end

class TestClass
  include InstanceMethods

  def initialize test_value
    initialize_object test_value
  end
end

test = TestClass.new 300
puts test.test_value