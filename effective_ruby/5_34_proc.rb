# ブロックの作り方のひとつ

def pass(&block)
  p block.class
  block
end

greeter = pass {|name| "Hello, #{name}"}

p greeter.call("World")

# 弱いProc, 強いProc

def test
  yield("a")
end

p test {|x, y, z| [x, y, z]}
p test {"b"}

func = ->(x) {"Hello #{x}"}

p func.call("a")
begin
  p func.call("a", "b")
rescue => e
  p e
end

# 判定

def lambda_check(&block)
  p block.lambda?
end

lambda_check {|x| x}
lambda_check(& ->(x){x})

# 引数の個数
p greeter.arity
func = ->(x, y=1) {x+y}
# 可変長の場合は、必須引数+1を負にしたものとなる
p func.arity
# 補数を取ると必須のみになる！
p ~func.arity
