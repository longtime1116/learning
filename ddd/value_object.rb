class Money
  attr_accessor :third
  attr_accessor :second
  attr_accessor :first
  attr_accessor :unit
  def initialize(third, second, first, unit)
    @third = third
    @second = second
    @first = first
    @unit= unit
  end
  def to_s
    (@third * 100 + @second * 10 + @first * 1).to_s + @unit
  end
end


class User
  def initialize(money)
    save_money(money)
  end

  def money
    @amount.to_s + @unit
  end
  private
  def save_money(money)
    @amount = money.third * 100 + money.second * 10 + money.first * 1
    @unit = money.unit
  end


end

m = Money.new(2,1,3,"yen")
p m.to_s #=> 213yen
user = User.new(m)
p user.money #=> 213yen
