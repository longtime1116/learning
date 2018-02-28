class Person
  attr_accessor :name, :birth_date

  def initialize(params)
    @name = params[:name]
    @birth_date = params[:birth_date]
  end

  def who_are_you(pre_word)
    p "#{pre_word} #{name}"
  end

  def hogeee
    p "hogeee"
  end
end

class Decorator
  def initialize(person)
    p "self: #{self}"
    p "(class << self; self; end): #{class << self; self; end}"
    # 引数に false を指定すると、レシーバのクラスのみ。親クラスとかなし。
    person.public_methods(false).each do |meth|
      p "method: #{meth}"
      (class << self; self; end).class_eval do
        define_method meth do |*args|
          person.send meth, *args
        end
      end
    end
  end

  # def method_missing(sym, *args, &block)
  #   p "method_missing!!!"
  #   p "sym:#{sym}"
  #   p "args:#{args}"
  #   p "block:#{block}"
  #   @person.send sym, *args, &block
  # end
end

# 引数の最後の hash は、{} を省略することができる
tom = Person.new(name: "tom", birth_date: 1991)

tom_dressed = Decorator.new(tom)

tom_dressed.who_are_you "I am"
tom_dressed.who_am_I "I am"


# 特異メソッドとは、特異クラスのインスタンスメソッドとして定義されるメソッド(特異クラスはsingleton)
# 特異クラスとは、ある特定のオブジェクト固有のクラスです。特異クラスは、オブジェクト一つに対して1対1の関係で存在するクラスです。例えば、オブジェクトPeopleの特異クラスは、オブジェクトPeopleのためだけのクラスであり、他のオブジェクトのクラスにはなり得ません。
# Person クラスは、Class クラスのオブジェクトである。Person の特異メソッド == クラスメソッドとなる。
# https://qiita.com/fujishin05/items/be60f4f788f2732921a4
