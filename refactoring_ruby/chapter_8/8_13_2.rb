# after
# module に切り出し、class 側で extend する

class OfficeWorker
  attr_reader :type_code
  def initialize(name, type_code = nil)
    self.type_code = type_code unless type_code.nil?
    @name = name
  end

  def type_code=(mod)
    # 特異メソッドとして module のメソッドが取り込まれる
    extend(mod) if type_code.nil?
  end
end

module Manager
  def salary
    3000
  end
end

module Engineer
  def salary
    2000
  end
end

module Sales
  def salary
    1500
  end
end

tom = OfficeWorker.new("Tom", Manager)
p tom.salary

kevin = OfficeWorker.new("Kevin")
kevin.type_code = Engineer
p kevin.salary

p kevin.class.ancestors #=> [OfficeWorker, Object, Kernel, BasicObject]
p kevin.singleton_methods #=> [:salary]
