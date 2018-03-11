module Defaults
  HOGE = ["aaa", "bbb"].freeze
end

def add(bar, buz=Defaults::HOGE)
  buz.map {|net| net << ".#{bar}"}
end

p Defaults::HOGE
p add("com")
p Defaults::HOGE  # [aaa.com, bbb.com] となってしまっている！！！







# freeze しないで試してみる
CONST = ["a", "b"]

p CONST[0].object_id
CONST[0] << "c"
p CONST[0].object_id #=> 上の object_id と同じ
CONST[0] = "c"
p CONST[0].object_id #=> object_id が変わる！


# ということで、object_id が変わるような変更は freeze するとできないが、object_id が変わらないならば変更可能。ポインタが変わらないのならOKみたいな感じか。





CONST2 = ["a", "b"].map!(&:freeze).freeze
p CONST2[0].object_id
#CONST2[0] << "c"     #=> エラーになる!
#p CONST2[0].object_id
#CONST2[0] = "c"     #=> エラーになる!
#p CONST2[0].object_id

# ということで、中身も freeze すれば書き換えは不可能にできる





CONST2 = ["c"]
p CONST2   #=> warning は出るが書き換えることができてしまう...
module Piyo
  CONST2 = ["c"].map!(&:freeze).freeze
end
Piyo.freeze
#Piyo::CONST2 = ["d"]   # これでようやくエラーになる
