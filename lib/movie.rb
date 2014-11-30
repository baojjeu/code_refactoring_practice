require 'price/default_price'
require 'price/regular_price'
require 'price/children_price'
require 'price/new_release_price'

class Movie
  REGULAR     = 0     # 普通片
  NEW_RELEASE = 1     # 新片
  CHILDRENS   = 2     # 兒童片

  attr_reader :title
  attr_reader :price_code

  def initialize(title, price_code)
    @title = title
    self.price_code = price_code
  end

  def price_code=(new_value)
    @price_code = new_value
    @price = case @price_code
             when REGULAR; RegularPrice.new
             when NEW_RELEASE; NewReleasePrice.new
             when CHILDRENS; ChildrenPrice.new
             end
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end

