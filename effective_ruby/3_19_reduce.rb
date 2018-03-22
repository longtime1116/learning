# よくあるやつ
total = (1..10).reduce(0) { |sum, num| sum += num }
p total

# 変形1(&: でブロック生成)
def sum1(enum)
  enum.reduce(0, &:+)
end
p sum1((1..10))

# 変形2(実はシンボルをわたせる)
def sum2(enum)
  enum.reduce(0, :+)
end
p sum2((1..10))




class User
  attr_reader :name, :age
  def initialize(name, age)
    @name, @age = name, age
  end
end
users = [
  User.new("Abby", 18),
  User.new("Bob", 21),
  User.new("Carol", 22)
]

# select してから map
p users.select { |u| u.age >= 21 }.map(&:name)
# reduce で一発で
hoge = users.reduce([]) do |names, u|
  names << u.name if u.age >= 21
  names
end
p hoge
