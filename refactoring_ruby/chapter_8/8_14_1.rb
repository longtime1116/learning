# before

class OfficeWorker
  def initialize(type_code, name)
    @type_code = type_code
    @name = name
  end

  def salary
    case @type_code
    when :manager
      3000
    when :engineer
      2000
    when :sales
      1500
    else
      500
    end
  end
end

tom = OfficeWorker.new(:manager, "Tom")

p tom.salary
