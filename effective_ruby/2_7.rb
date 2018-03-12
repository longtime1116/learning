class Base
  def m1(x, y)
    x + y
  end
end

class Derived < Base
  def m1(x)
    x + 100
    # super   # この書き方をすると、Base#m1 と同じ形で引数を渡そうとするのでエラーになる
    super(x, 100)
  end
end

hoge = Derived.new

p hoge.m1(1)
