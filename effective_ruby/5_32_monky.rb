module OnlySpace
  refine(String) do
    def only_space?
      true
    end
  end
end

class Person
  using(OnlySpace)

  def initialize(name)
    @name = name
  end

  def valid?
    !@name.only_space?
  end

  def display(io=$stdout)
    p "in display: #{@name.only_space?}"
    io.puts "in io.puts: #{@name.only_space?}"
  end
end

hoge = Person.new("hoge")

p "call valid?: #{hoge.valid?}"
