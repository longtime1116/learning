X = "x_hoge"
module A
  X = "x_hoge_in_A"
  class B
    Y = "y_hoge_in_B"
  end
  p "X => #{X}"
  p "::X => #{::X}"
  p "B::Y => #{B::Y}"
end
p "A::B::Y => #{A::B::Y}"
p "A.constants: #{A.constants}"
p "A::B.constants: #{A::B.constants}"


#"X => x_hoge_in_A"
#"::X => x_hoge"
#"B::Y => y_hoge_in_B"
#"A::B::Y => y_hoge_in_B"
#"A.constants: [:X, :B]"
#"A::B.constants: [:Y]"
