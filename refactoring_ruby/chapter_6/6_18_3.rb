class Person
  def self.attrs_with_empty_predicate(*args)
    attr_accessor *args

    args.each do |attribute|
      define_method "#{attribute}_empty?" do
        self.send(attribute).nil?
      end
    end
  end
  attrs_with_empty_predicate :name, :age
end


# 引数の最後の hash は、{} を省略することができる
tom = Person.new()
tom.name = "tom"

p tom.name
p tom.name_empty?
p tom.age
p tom.age_empty?
