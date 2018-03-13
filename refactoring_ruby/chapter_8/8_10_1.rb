# before

class Course
  attr_reader :name
  def initialize(name, advanced)
    @name = name
    @advanced = advanced
  end
end

class Person
  attr_accessor :courses
  def initialize(name)
    @name = name
  end
end

kent = Person.new("Kent")

courses = []
courses << Course.new("math", false)
courses << Course.new("english", true)

kent.courses = courses
p kent.courses.map(&:name)
# 上書きできてしまう
kent.courses = [Course.new("sciense", true)]
p kent.courses.map(&:name)
