# 変わった挙動にみえるやつ

class MyClass
  def my_method
    "original my_method"
  end

  def another_method
    my_method
  end
end


module MyClassRefinements
  refine MyClass do
    def my_method
      "refined my_method"
    end
  end
end

using MyClassRefinements

p MyClass.new.my_method
p MyClass.new.another_method
