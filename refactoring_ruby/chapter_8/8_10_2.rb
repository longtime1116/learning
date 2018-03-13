# after

class Course
  attr_reader :name
  def initialize(name, advanced)
    @name = name
    @advanced = advanced
  end
end

class Person
  def initialize(name)
    @name = name
    @courses = []
  end

  def initialize_courses(courses)
    raise "Courses should be empty" unless @courses.empty?
    courses.each { |course| add_course(course) }
  end

  def add_course(course)
    @courses << course
  end

  def remove_course(course)
    @courses.delete(course)
  end

  def courses
    @courses.dup
  end
end

kent = Person.new("Kent")

start_courses = []
start_courses << Course.new("math", false)
start_courses << Course.new("english", true)
kent.initialize_courses(start_courses)
p kent.courses.map(&:name)

kent.add_course(Course.new("japanese", false))
p kent.courses.map(&:name)

courses = kent.courses
courses << Course.new("tama", false)
# dup に対して追加しているので、元は変更されない！
p kent.courses.map(&:name)

# kent.initialize_courses([Course.new("study", false)]) #=> エラーになる！
