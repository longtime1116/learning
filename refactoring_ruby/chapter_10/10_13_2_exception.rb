# 呼び出し元で弾くケース
# 「エラーがあまり起きそうでなければ、私なら、例外が発生したあとで処理をするだろう」
class BalanceError < StandardError
end

class Account
  def initialize(balance)
    @balance = balance
  end

  def withdraw(amount)
    raise BalanceError.new if amount > @balance
    @balance -= amount
  end

  def can_withdraw?(amount)
    amount <= @balance
  end
end

# こんな風に使う
account = Account.new(1000)
amount = 2000
begin
  p account.withdraw(amount)
  p "success"
rescue BalanceError
  p "error"
end

