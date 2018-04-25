class Duck
  def initialize(name)
    @name = name
  end

  def speak
    puts ("#{@name} はガーガー")
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def speak
    puts ("#{@name} はゲロゲロ")
  end

end

class Pond
  def initialize(number_animals, animal_class)
    @animals = []
    number_animals.times do |i|
      @animals << animal_class.new("#{animal_class.to_s}#{i}") 
    end
  end

  def simulate
    @animals.each {|animal| animal.speak}
  end
end

Pond.new(3, Duck).simulate
Pond.new(5, Frog).simulate
