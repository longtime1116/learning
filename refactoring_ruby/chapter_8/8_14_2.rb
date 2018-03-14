# after
# state/strategy pattern
# なんか微妙な気がする。OfficeWorker クラスが委譲先のクラス名を知っていて依存している点が良くない。
# こういうtypecodeごとの処理がたくさんある場合は、ポリモーフィズムにしたほうが良いと思う
require 'forwardable'

class OfficeWorker
  extend Forwardable
  def_delegators :@status, :salary

  def initialize(type_code, name)
    @status = type_code
    @name = name
  end

  def change_member_count(params)
    raise "You cannot add member" unless @status.is_a?(Manager)
    @status = Manager.new(@status.upgrade_parameters.merge(params))
  end

  def member_count
    raise "You cannot add member" unless @status.is_a?(Manager)
    @status.member_count
  end
end

class Manager
  attr_accessor :member_count
  def initialize(params)
    @member_count = params[:member_count]
  end

  def upgrade_parameters
    {
      member_count: member_count
    }
  end

  def salary
    3000
  end
end

class Engineer
  attr_accessor :skills
  def initialize(params)
    @skills = params[:skills]
  end

  def salary
    2000
  end
end

class Sales
  attr_accessor :result
  def initialize(params)
    @result = params[:result]
  end
  def salary
    1500
  end
end

tom = OfficeWorker.new(Manager.new({member_count: 10}), "Tom")
p tom.salary
p tom.member_count
tom.change_member_count({member_count: 3})
p tom.member_count


kevin = OfficeWorker.new(Engineer.new(skills: ["ruby", "C"]), "Kevin")
p kevin.salary
