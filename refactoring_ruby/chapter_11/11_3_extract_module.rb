module Bmi

  # before_save とか callback があれば、こんな風に書けるよという話
  # Module.included は include された後に呼ばれる
  def self.included(klass)
    klass.class_eval do
      p "hoge"
    end
  end

  def bmi
    @bmi = @weight / (height_m * height_m)
  end

  def height_m
    @height.to_f / 100
  end
end

class Men
  include Bmi
  def initialize(height, weight)
    @height, @weight = height, weight
  end
end

class Wemen
  include Bmi
  def initialize(height, weight)
    @height, @weight = height, weight
  end
end

tom = Men.new(178, 64)
adel = Wemen.new(158, 60)

p tom.bmi
p adel.bmi

p Men.ancestors # [Men, Bmi, Object, Kernel, BasicObject]
