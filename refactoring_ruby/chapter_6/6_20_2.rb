class Person
  def self.attr_with_default(options)
    options.each_pair do |attribute, default_value|
      eval "def #{attribute}
              @#{attribute} ||= #{default_value}
            end"
    end
  end

  attr_with_default emails: "[]",
                    employee_number: 100
end

hoge = Person.new
p hoge.emails
p hoge.employee_number
