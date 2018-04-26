# 池に住むものたち
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

# 密林に住むものたち
class Tiger
  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name} はガオー"
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{@name} は密集"
  end
end

class PondOrganismFactory
  def new_animal(name)
    Duck.new(name)
  end

  def animal_type
    Duck.to_s
  end

  def new_plant(name)
    Algae.new(name)
  end

  def plant_type
    Algae.to_s
  end
end

class JungleOrganismFactory
  def new_animal(name)
    Tiger.new(name)
  end

  def animal_type
    Tiger.to_s
  end

  def new_plant(name)
    Tree.new(name)
  end

  def plant_type
    Tree.to_s
  end
end

class Habitat
  def initialize(number_animals, number_plants, organism_factory)
    @animals = []
    number_animals.times do |i|
      @animals << organism_factory.new_animal("#{organism_factory.animal_type}#{i}")
    end
    @plants = []
    number_plants.times do |i|
      @plants << organism_factory.new_plant("#{organism_factory.plant_type}#{i}")
    end
  end

  def simulate
    @animals.each {|animal| animal.speak}
    @plants.each {|plant| plant.grow}
  end
end

#Pond.new(3, Duck, 2, Algae).simulate
#Pond.new(5, Frog, 4, WaterLily).simulate

Habitat.new(3, 2, PondOrganismFactory.new).simulate
Habitat.new(1, 5, JungleOrganismFactory.new).simulate


