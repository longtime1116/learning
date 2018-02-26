class Person
  attr_reader :name, :birth_date

  def initialize(params)
    @name = params[:name]
    @birth_date = params[:birth_date]
  end
end

# 引数の最後の hash は、{} を省略することができる
tom = Person.new(name: "tom", birth_date: 1991)
p "tom.name: #{tom.name}"
p "tom.birth_date: #{tom.birth_date}"
