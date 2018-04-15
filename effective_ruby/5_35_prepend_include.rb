module A
  def hello
    "hello@A"
  end
end

module B
  def hello
    "hello@B"
  end
end

class C1
  include A
  include B

  def hello
    "hello@C"
  end
end

p "===== C1(include) ====="
p C1.ancestors
p C1.new.hello

class C2
  prepend A
  prepend B

  def hello
    "hello@C"
  end
end

p "===== C2(prepend) ====="
p C2.ancestors
p C2.new.hello
