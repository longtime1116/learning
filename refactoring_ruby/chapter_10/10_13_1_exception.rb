# メソッド呼び出しの前でエラー条件をチェックし、用心のためにassertを仕込むケース

module Assertions
  class AssertionFailedError < StandardError
  end

  def assert(message, &condition)
    unless condition.call
      raise AssertionFailedError.new("Assertion Failed: #{message}")
    end
  end
end

class Account
  include Assertions

  def initialize(balance)
    @balance = balance
  end

  def withdraw(amount)
    assert("amount too large") { amount <= @balance }
    @balance -= amount
  end

  def can_withdraw?(amount)
    amount <= @balance
  end
end

account = Account.new(1000)

# こんな風に使う
amount = 100
if account.can_withdraw?(amount)
  account.withdraw(amount)
end

p account.withdraw(500)
account.withdraw(800)

# 10_13_exception.rb:7:in `assert': Assertion Failed: amount too large (Assertions::AssertionFailedError)
# from 10_13_exception.rb:20:in `withdraw'
# from 10_13_exception.rb:27:in `<main>'

