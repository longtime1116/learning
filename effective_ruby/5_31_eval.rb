begin
  eval("p x")
rescue => e
  p e
end

def hoge_scope
  x = "in hoge scope"
  # ローカルスコープをキャプチャして返すことができる
  binding
end

eval("p x", hoge_scope)
