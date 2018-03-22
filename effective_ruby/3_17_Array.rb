# Kernel#Array これは実はメソッド。配列にしてくれる
p Array(nil) #=> []
p Array("hoge") #=> ["hoge"]

class Pizza
  def initialize(toppings)
    Array(toppings).each do |topping|
      p topping
    end
  end
end

Pizza.new() # nil を渡してもエラーを起こさない
