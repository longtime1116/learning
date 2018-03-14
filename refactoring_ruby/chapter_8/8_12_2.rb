# after
# ポリモーフィズム

module OfficeWorker
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def salary
    500
  end
end

class Manager
  include OfficeWorker

  def salary
    3000
  end
end

class Engineer
  include OfficeWorker

  def salary
    2000
  end
end

class Sales
  include OfficeWorker

  def salary
    1500
  end
end




tom = Manager.new("Tom")
p tom.name
p tom.salary

kevin = Engineer.new("Kevin")
p kevin.name
p kevin.salary

p kevin.class.ancestors # => [Engineer, OfficeWorker, Object, Kernel, BasicObject]
