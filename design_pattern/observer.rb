module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers(employee)
    @observers.each do |observer|
      observer.update(employee)
    end
  end
end

class Taxmen
  def update(employee)
    p "tax changed : #{employee.name} (#{employee.salary})"
  end
end

class Wife
  def update(employee)
    p "good job!! #{employee.name}!"
  end
end

class Employee
  include Subject

  attr_reader :name, :salary
  def initialize(name, salary)
    super()
    @name = name
    @salary = salary
  end

  def salary=(salary)
    @salary = salary
    notify_observers(self)
  end
end

fred = Employee.new("fred", 1000)
fred.add_observer(Wife.new)
fred.add_observer(Taxmen.new)

fred.salary = 1500
