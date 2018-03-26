total = 0
sum = catch(:jump) do
  100.times do |num|
    begin
      total += num
      if total > 45
        throw(:jump, total)
      end
      raise if total < 0
    ensure
      # ちゃんと通るので安全
      p "ensure" if total > 45
    end

  end
end
p sum
