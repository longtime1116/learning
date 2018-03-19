class Hoge
  def initialize(value)
    @value = value
  end

  def ==(other)
    # 同じクラスのインスタンスからのみ呼び出せるのがprotected
    @value == other.value
  end
  protected

  def value
    @value
  end
end

hoge = Hoge.new("hoge")
geho = Hoge.new("geho")
hoge2 = Hoge.new("hoge")

p hoge == geho
p hoge == hoge2

begin
  hoge.value
rescue => e
  p e
end
