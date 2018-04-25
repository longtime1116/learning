class Duck
  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name} はガーガー"
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name} はゲロゲロ"
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{@name} は日光浴"
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{@name} は浮いて日光浴"
  end
end

class Pond
  def initialize(number_animals, animal_class, number_plants, plant_class)
    @animals = []
    number_animals.times do |i|
      @animals << animal_class.new("#{animal_class.to_s}#{i}") 
    end
    @plants = []
    number_plants.times do |i|
      @plants << plant_class.new("#{plant_class.to_s}#{i}") 
    end
  end

  def simulate
    @animals.each {|animal| animal.speak}
    @plants.each {|plant| plant.grow}
  end
end

Pond.new(3, Duck, 2, Algae).simulate
Pond.new(5, Frog, 4, WaterLily).simulate
