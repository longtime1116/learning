class Customer
  def self.who_am_i
    p "Mike"
  end
end

Customer.who_am_i
p Customer.singleton_class # #<Class:Customer> 
p Customer.singleton_class.class
p Customer.class
p Customer.ancestors # [Customer, Object, Kernel, BasicObject]
p Customer.new.class
