# block はオブジェクトではないが、オブジェクト化するには proc や lambda を用いる

# proc
inc = Proc.new { |x| x + 1 }
p inc.call(2)
p inc.class
p inc.lambda?
inc2 = proc { |x| x + 1 }
p inc2.call(2)

# lambda
dec = lambda { |x| x - 1 }
p dec.call(2)
p dec.class
p dec.lambda?
dec2 = ->(x) { x - 1 }
p dec2.call(2)


def greet
  p "Hello, #{yield}"
end

greet_proc = Proc.new { "Bill" }
greet(&greet_proc)

# proc と lambda の違い
## その1: proc は return でもとのスコープから抜けるが、lambda は単にそのブロックから抜けるだけ

p = proc do
  p "in proc"
  return "proc done"
  p "hoge"
end

begin
  p.call
rescue => e
  # LocalJumpError(top レベルからは戻れないので)
  p e
end

l = lambda do
  p "in lambda"
  return "lambda done"
  p "hoge"
end
p l.call

# その2: 引数の制約が lambda のほうが厳しい

p = proc do |x, y|
  p x
  p y
end
p.call(1, 2, 3)

# lambda だとエラーになる。入力の変数に対して出力が決まった値になる関数としての機能なので
# この厳格性、procとの違いは直感的にわかりやすいと思う。
l = lambda do |x, y|
  p x
  p y
end
begin
  l.call(1, 2, 3)
rescue => e
  p e
end


# proc/lambda と method の違い
# proc/lambda はクロージャとして機能するため定義されたスコープで評価される。
# method はオブジェクトのスコープで評価される。
