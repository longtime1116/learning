class HtmlFormatter
  def output_report(name)
    p "#{name}:html"
  end
end

class TextFormatter
  def output_report(name)
    p "#{name}:text"
  end
end

class Person
  attr_reader :name, :formatter
  def initialize(name, formatter)
    @name = name
    @formatter = formatter
  end

  def output_report
  # 引数として self を渡して 呼び出し先で context.name みたいな感じで書くこともできるが、密結合になる
    formatter.output_report(name)
  end
end

hoge = Person.new("hoge", HtmlFormatter.new)
hoge.output_report
geho = Person.new("geho", TextFormatter.new)
geho.output_report
