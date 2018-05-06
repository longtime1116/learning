## prepend を使う

module ExplicitString
  def length
    super > 5 ? "long" : "short"
  end
end

String.class_eval do
  prepend ExplicitString
end

p "War and Peace".length
