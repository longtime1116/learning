def setup(description, &block)
  @setups << {:description => description, :content => block}
end

def event(description, &block)
  @events << {:description => description, :condition => block}
end


@setups = []
@events = []
load 'events.rb'

@events.each do |event|
  @setups.each {|set| set[:content].call}
  p event[:description] if event[:condition].call
end
