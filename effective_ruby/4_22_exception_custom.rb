class TemperatureError < StandardError
  attr_reader :temperature

  def initialize(temperature)
    @temperature = temperature
    super("invalid temperature: #{@temperature}")
  end
end

raise TemperatureError.new(110)
# 上書きされるので第二引数は使わない
#raise(TemperatureError.new(110), "overwrite")
