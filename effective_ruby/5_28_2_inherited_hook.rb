# module で定義してミックスインするパターン
module PreventInheritance
  class InheritanceError < StandardError; end

  def inherited(child)
    raise(InheritanceError, "#{child} cannot inherit from #{self}")
  end
end

begin
  Array.extend(PreventInheritance)
  class BetterArray < Array; end
rescue => e
  p e
end

# 直接定義
class Parent
  def self.inherited(child)
    raise "#{child} cannot inherit from #{self}"
  end
end

begin
  class Child < Parent; end
rescue => e
  p e
end
