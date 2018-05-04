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
