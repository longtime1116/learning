class Person
  attr_reader :name, :birth_date

  def initialize(params)
    @name = params[:name]
    @birth_date = params[:birth_date]
  end

  def who_are_you(pre_word)
    p "#{pre_word} #{name}"
  end

end

class Decorator
  def initialize(person)
    @person = person
  end

  def method_missing(sym, *args, &block)
    p "method_missing!!!"
    p "sym:#{sym}"
    p "args:#{args}"
    p "block:#{block}"
    @person.send sym, *args, &block
  end
end

# 引数の最後の hash は、{} を省略することができる
tom = Person.new(name: "tom", birth_date: 1991)

tom_dressed = Decorator.new(tom)

tom_dressed.who_are_you "I am"
tom_dressed.who_am_I "I am"
