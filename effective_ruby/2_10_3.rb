# after 2

class Team
  attr_reader :status

  Person = Struct.new(:name, :birth_date, :math, :english) do
    def avg
      (math + english) / 2.0
    end
  end

  def initialize
    @status = []
    @status << Person.new("Tom", "1991/01/01", 91, 10)
    @status << Person.new("John", "2001/01/01", 98, 100)
  end

  def avg
    return nil if status.size.zero?
    total = status.reduce(0.0) do |sum, state|
      sum + state.avg
    end

    total / status.size.to_f
  end
end

hoge = Team.new

p hoge.avg
