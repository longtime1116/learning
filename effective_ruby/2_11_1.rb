module Hoge1
  KEY = "pass"

  class HogeHoge
    attr_reader :key
    def initialize(key=KEY)
      @key = key
    end
  end
end

p Hoge1::HogeHoge.new.key



module Hoge2
  KEY = "pass"
end

class Hoge2::HogeHoge
  attr_reader :key
  def initialize(key=KEY)
    @key = key
  end
end

#p Hoge2::HogeHoge.new.key      #=> エラーになる




module Hoge3
  KEY = "pass"
end

class Hoge3::HogeHoge
  attr_reader :key
  def initialize(key=Hoge3::KEY)
    @key = key
  end
end

p Hoge3::HogeHoge.new.key

