# after 1

class Team
  attr_reader :status

  Person = Struct.new(:name, :birth_date, :math, :english)

  def initialize
    @status = []
    @status << Person.new("Tom", "1991/01/01", 91, 10)
    @status << Person.new("John", "2001/01/01", 98, 100)
  end

  def avg
    return nil if status.size.zero?
    total = status.reduce(0.0) do |sum, state|
      # ここが OOP っぽくなる
      # もし属性が存在しなければ NoMethodError が出るのが良い！！
      sum + (state.math + state.english) / 2.0
    end

    total / status.size.to_f
  end
end

hoge = Team.new

p hoge.avg
