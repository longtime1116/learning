# 変わった挙動に見えるやつの String 版。これだとなぜこういう挙動をするのかわかりやすい。

class String
  def another_reverse
    reverse
  end
end

module StringRefinement
  refine String do
    def reverse
      "refined reverse"
    end
  end
end

using StringRefinement

p "hoge".reverse
p "hoge".another_reverse
