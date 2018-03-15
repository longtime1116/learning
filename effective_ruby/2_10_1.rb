# before
class Team
  attr_reader :status
  def initialize
    @status = []
    @status << {
      name: "Tom",
      birth_date: "1991/01/01",
      math: 91,
      english: 10,
    }
    @status << {
      name: "John",
      birth_date: "2001/01/01",
      math: 98,
      english: 100,
    }
  end

  def avg
    return nil if status.size.zero?
    total = status.reduce(0.0) do |sum, state|
      sum + (state[:math] + state[:english]) / 2.0
    end

    total / status.size.to_f
  end
end

hoge = Team.new

p hoge.avg
