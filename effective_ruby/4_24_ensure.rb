class Lock
  attr_accessor :lock_state

  def initialize
    @lock_state = false
  end

  def self.acquire
    lock = new
    p "# after create"
    p lock.lock_state
    lock.exclusive_lock!
    p "# after exclusive_lock!"
    p lock.lock_state
    if block_given?
      yield(lock)
    else
      lock
    end
  ensure
    if block_given?
      lock.unlock! if lock
    end
  end

  def exclusive_lock!
    @lock_state = true
  end

  def unlock!
  p "# just before unlock!"
    p lock_state
    @lock_state = false
  p "# just after unlock!"
    p lock_state
  end
end

p "===== do not give block ====="
lock = Lock.acquire
p lock.lock_state

p "===== give block ====="
Lock.acquire do |lock|
  p "# in block(before raise)"
  p lock.lock_state
  p "# raise!!!!!"
  raise
end

# File.open do {|file| } も同じように ensure で close している
