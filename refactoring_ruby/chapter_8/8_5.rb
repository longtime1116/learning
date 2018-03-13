class Module
  def deprecate(methodName, &block)
    p "hoge"
    module_eval <<-END
      # 別名を付けて、書き換え前のメソッドをあとから呼べる
      alias_method :original_#{methodName}, :#{methodName}
      def #{methodName}(*args, &block)
        $stderr.puts"Warning"
        original_#{methodName}(*args, &block)
      end
    END
  end
end

class Foo
  def initialize
    p "init"
  end
  def foo
    puts "in the foo"
  end
  # ↓でfooの内容が置き換わる
  deprecate :foo

  #alias_method :original_foo, :foo
  #def foo
  #  $stderr.puts"Warning"
  #  original_foo
  #end
end

Foo.new.foo
#Foo.new.deprecated_foo


p Class.ancestors # [Class, Module, Object, Kernel, BasicObject] なので、Module に書くと使える
