class DomainEventPublisher
  @@subscribers = []
  @@publishng = false

  def publish(event)
    return if @@publishng
    @@publishing = true

    @@subscribers.each do |subscriber|
      next unless subscriber.need_this_event?(event)
      subscriber.handle_event(event)
    end
  end

  def subscribe(subscriber)
    @@subscribers << subscriber
    p "subscribed!!! (#{subscriber.name})"
  end
end


class Subscriber

  def initialize(name, types)
    @name = name
    @types = types
  end

  def need_this_event?(event)
    @types.include?(event.type)
  end

  def handle_event(event)
    p "event handled!! (#{@name}: #{event.type})"
  end

  def name
    @name
  end
end


class Event
  def initialize(type)
    @type = type
  end

  def type
    @type
  end
end


publisher = DomainEventPublisher.new
subscriber1 = Subscriber.new("pixta",["ItemDownloaded", "ItemSearched"])
subscriber2 = Subscriber.new("lightbox",["ItemLiked"])
publisher.subscribe(subscriber1)
publisher.subscribe(subscriber2)
event1 = Event.new("ItemDownloaded")
event2 = Event.new("ItemSearched")
event3 = Event.new("ItemLiked")
event4 = Event.new("ItemPurchased")
[event1, event2, event3, event4].each do |e|
  publisher.publish(e)
end
