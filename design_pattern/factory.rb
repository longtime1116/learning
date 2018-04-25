class Duck
  def initialize(name)
    @name = name
  end

  def speak
    puts ("#{@name} はガーガー鳴いています。")
  end
end

class Pond
  def initialize(number_ducks)
    @ducks = []
    number_ducks.times do |i|
      @ducks << Duck.new("Duck#{i}") 
    end
  end

  def simulate
    @ducks.each {|duck| duck.speak}
  end
end

Pond.new(3).simulate
