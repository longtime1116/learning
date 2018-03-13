require 'set'

class Customer
  attr_reader :orders

  def initialize
    @orders = Set.new
  end

  def friend_orders
    orders
  end

  def order_items
    orders.map(&:item)
  end
end

class Order
  attr_reader :customer, :item

  def initialize(item)
    @item = item
  end

  def customer=(value)
    customer.friend_orders.subtract(self) unless customer.nil?
    @customer = value
    customer.friend_orders.add(self) unless customer.nil?
  end

end

tom = Customer.new

banana = Order.new("banana")
banana.customer = tom
tomato = Order.new("tomato")
tomato.customer = tom

p tom.order_items
