class String
  def another_reverse
    reverse
  end
end

module StringExtensions
  refine String do
    def reverse
      "esrever"
    end
  end
end


class Foo
  using StringExtensions

  def use_reverse
    "hoge".reverse
  end

  def use_another_reverse
    "hoge".another_reverse
  end
end

class Bar
  def use_reverse
    "hoge".reverse
  end
end

p Foo.new.use_reverse
p Foo.new.use_another_reverse    # こいつは refine されていない reverse を呼び出す
p Bar.new.use_reverse
