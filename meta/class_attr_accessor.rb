# クラスのアトリビュートは特異クラスに定義すれば良い
class MyClass
  class << self
    attr_accessor :name
  end
end

MyClass.name = "hoge"
p MyClass.name
