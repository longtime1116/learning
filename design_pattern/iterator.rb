class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end

  def output_balance
    p balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

account1 = Account.new("Adam", 100)
account2 = Account.new("Bob", 50)
account3 = Account.new("Carol", 200)

portfolio = Portfolio.new
portfolio.add_account(account1)
portfolio.add_account(account2)
portfolio.add_account(account3)

portfolio.each { |account| p account.name }
portfolio.each(&:output_balance)


p "------sort------"
p portfolio.sort.each(&:output_balance)
