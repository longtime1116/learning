class JobItem
  attr_reader :quantity, :employee

  def initialize(unit_price, quantity)
    @unit_price = unit_price
    @quantity = quantity
  end

  def total_price
    unit_price * @quantity
  end

  def unit_price
    @unit_price
  end
end

class LaborItem < JobItem
  def initialize(quantity, employee)
    super(0, quantity)
    @employee = employee
  end

  def unit_price
    @employee.rate
  end
end

class Employee
  attr_reader :rate

  def initialize(rate)
    @rate = rate
  end
end

kent = Employee.new(10.0)
j1 = JobItem.new(10, 5)
p j1.total_price
l1 = LaborItem.new(5, kent)
p l1.total_price
