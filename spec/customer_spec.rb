require "minitest/autorun"
require "customer.rb"

class TestCustomer < Minitest::Test

  def test_rent_a_movie
    movie_spider_man = Movie.new('SpiderMan', Movie::NEW_RELEASE)
    movie_dragon_balls = Movie.new('Dragon Balls', Movie::CHILDRENS)

    eddie = Customer.new 'eddie'
    rental1 = Rental.new(movie_spider_man, 7)
    rental2 = Rental.new(movie_dragon_balls, 10)

    eddie.add_rental rental1
    eddie.add_rental rental2

    statement = "Rental Record for eddie\n\tSpiderMan\t21\n\tDragon Balls\t12.0\nAmount owed is 33.0\nYou earned 3 frequent renter points"
    assert_equal(eddie.statement, statement, "計算結果不符")
  end

end

