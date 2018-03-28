module DefaultPrice
  def frequent_renter_points
    1
  end
end

class RegularPrice
  include DefaultPrice

  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end

class NewReleasePrice
  def charge(days_rented)
    days_rented * 3
  end

  def frequent_renter_points(days_rented)
    (days_rented > 1) ? 2 : 1
  end
end

class ChildrensPrice
  include DefaultPrice

  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end

class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_writer :price

  def initialize(title, the_price)
    @title, @price = title, the_price
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(day)
    @price.frequent_renter_points(day)
  end
end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    movie.charge(days_rented)
  end

  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end

class Statement
  def value(customer)
    result = header_string(customer)
    customer.rentals.each do |rental|
      # show figures for this rental
      result += each_rental_string(rental)
    end
    # add footer lines
    result += footer_string(customer)
    result
  end
end

class TextStatement < Statement
  def header_string(customer)
    "Rental Record for #{customer.name}\n"
  end

  def each_rental_string(customer)
    "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
  end

  def footer_string(customer)
    <<-EOS
    Amount owed is #{customer.total_charge}\n
    You earned #{customer.total_frequent_renter_points} frequent renter points
    EOS
  end
end

class HtmlStatement < Statement
  def header_string(customer)
    "<h1>Rentals for <em>#{customer.name}</em></h1><p>\n"
  end

  def each_rental_string(customer)
    "\t" + rental.movie.title + ": " + rental.charge.to_s + "<br>\n"
  end

  def footer_string(customer)
    <<-EOS
    <p>
      You owe <em>#{customer.total_charge}</em>
    <p>
      On this rental you earned
    <p>
      <em>#{customer.total_frequent_renter_points}</em>
      frequent renter points
    </p>
    EOS
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    TextStatement.value(self)
  end

  def html_statement
    HtmlStatement.value(self)
  end

  private

  def total_charge
    @rentals.reduce(0) {|sum, rental| sum + rental.charge}
  end

  def total_frequent_renter_points
    @rentals.reduce(0) {|sum, rental| sum += rental.frequent_renter_points}
  end
end
