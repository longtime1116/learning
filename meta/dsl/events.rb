#event "always" do
#  true
#end
#
#event "never" do
#  false
#end

setup "空の高さ"do
  @sky_height = 100
end

setup "山の高さ"do
  @mountailns_height = 200
end

event "空が落ちてくる" do
  @sky_height < 300
end

event "空が山よりも下になってしまった" do
  @sky_height < @mountailns_height
end

event "手遅れ" do
  @sky_height < 0
end
