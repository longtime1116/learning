begin
  eval("p x")
rescue => e
  p e
end

def hoge_scope
  x = "in hoge scope"
  # ローカルスコープをキャプチャして返すことができる
  binding
end

eval("p x", hoge_scope)



####################################################################################
class Widget
  def initialize(name)
    @name = name
  end
end

w = Widget.new("Gear")

# その instance をレシーバとしてブロックを実行する
# instance_eval のなかで method 定義すると、特異メソッドを作ることになる
p w.instance_eval {@name}
w.instance_eval do
  def in_stock?
    false
  end
end

p w.singleton_methods(false)

Widget.instance_eval  do
  def table_name
    "widgets"
  end
end

p Widget.table_name
p Widget.singleton_methods(false)


# どのインスタンスでも使えるインスタンスメソッドを定義するには class_eval
Widget.class_eval do
  attr_accessor(:name)

  def sold?
    false
  end
end

w = Widget.new("Engine")
p w.sold?
p w.public_methods(false)

####################################################################################
