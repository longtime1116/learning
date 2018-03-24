# default value のセットの仕方
def with_no_default_value
  %w(anne bob carol).reduce({}) do |hash, str|
    hash[str] = str.to_sym
    hash
  end
end

p "===== with_no_default_value ====="
p with_no_default_value #=> {"anne"=>:anne, "bob"=>:bob, "carol"=>:carol}
p with_no_default_value["donald"]
p with_no_default_value.default

def with_default_value
  %w(anne bob carol).reduce(Hash.new(:nobody)) do |hash, str|
    hash[str] = str.to_sym
    hash
  end
end

p "===== with_default_value ====="
p with_default_value #=> {"anne"=>:anne, "bob"=>:bob, "carol"=>:carol}
p with_default_value["donald"]
p with_default_value.default

# 望まない挙動
h = Hash.new([])
p "===== Hash.new([]) ====="
p "default: " + h.default.to_s
h[:hoge] = h[:hoge] << :HOGE
h[:geho] = h[:geho] << :GEHO
p "h.keys: " + h.keys.to_s
p "h[:hoge]: " + h[:hoge].to_s
p "h[:geho]: " + h[:geho].to_s

# ブロックを渡すと毎回実行される
h = Hash.new { [] }
p "===== Hash.new([]) ====="
p "default: " + h.default.to_s # default は nil を返す
h[:hoge] = h[:hoge] << :HOGE
h[:geho] = h[:geho] << :GEHO
p "h.keys: " + h.keys.to_s
p "h[:hoge]: " + h[:hoge].to_s
p "h[:geho]: " + h[:geho].to_s

# こういう判定は駄目
p "===== conditions ====="
h = Hash.new(:none)
h[:hoge] = :hoge
if h[:geho]
  p "geho exists! (h.keys: #{h.keys.to_s} )" # geho はないのに
end
# has_key? を使いましょう
if h.has_key?(:hoge)
  p "hoge exists! (h.keys: #{h.keys.to_s} )"
end
if h.has_key?(:geho)
  p "geho exists! (h.keys: #{h.keys.to_s} )"
else
  p "geho dose not exist!"
end

# fetch
p "===== fetch ====="
h = {}
p h[:hoge]
p h.fetch(:hoge, [])
h = Hash.new("none")
p h[:hoge]
p h.fetch(:hoge, [])
