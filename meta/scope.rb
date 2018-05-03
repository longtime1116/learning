val = "hoge"
p "top レベルで定義した変数 val: #{val}"
Hoge = Class.new do
  p "クラス定義の中から val: #{val} を参照できる"
  define_method :call_val do
    p "クラス定義の中のメソッドの中から val: #{val} を参照できる"
  end
end

Hoge.new.call_val

# class や def を使うと、scope を共有できない。
# このように共有する方法をフラットスコープと呼ぶ


class A
  def initialize
    @hoge = "instance variable"
  end
end

A.new.instance_eval { p @hoge }
