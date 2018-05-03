class A
  def initialize
    @x = 1
  end
end

class B
  def hoge
    @y = 2
    A.new.instance_eval { p "@x: #{@x}, @y: #{@y}" }
  end
end

B.new.hoge

class A2
  def initialize
    @x = 1
  end
end

class B2
  def hoge
    @y = 2
    A.new.instance_exec(@y) { |y| p "@x: #{@x}, @y: #{y}" }
  end
end

B2.new.hoge
