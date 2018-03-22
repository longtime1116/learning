# array は参照渡しされるので、中身を書き換えることができてしまう
def change!(array)
  array[0] = "new"
end

str = %w(old middle hoge)
change!(str)
p str #=> ["new", "middle", "hoge"]


# 対処法として、もとの値を書き換えないという選択がある
def change(array)
  array.map {|str| str + "_hoge"}
end

str = %w(old middle hoge)
p change(str)
p str #=> ["new", "middle", "hoge"]


# dup/clone は shallow copy
a = ["Polar"]
b = a.dup << "Bear"
b.each {|x| x.sub!("lar", "oh")}
p b #=> ["Pooh", "Bear"]
p a #=> ["Pooh"]


# deep copy には Marshal を使うという手がある
# しかしメモリをたくさん食う。シリアライズされたバイトストリームもメモリを食うから。

a = ["Monkey", "Brains"]
b = Marshal.load(Marshal.dump(a))
b.each(&:upcase!)
p a
p b
