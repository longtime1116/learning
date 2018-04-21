class Person
  attr_reader :name, :formatter
  def initialize(name, &formatter)
    @name = name
    @formatter = formatter
  end

  def output_report
    # strategy として実現したい機能が1つのみなら、こういうやりかたもある。
    # クラスが不要になる。
    formatter.call(name)
  end
end

hoge = Person.new("hoge") { |name| p "#{name}:html" }
hoge.output_report
geho = Person.new("geho") { |name| p "#{name}:text"  }
geho.output_report
