module DefaultPrice
  def frequent_renter_points(days_rented)
    1
  end
end

class RegularPrice
  include DefaultPrice

  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
  end
end

class NewReleasePrice
  def frequent_renter_points(days_rented)
    (days_rented > 1) ? 2 : 1
  end

  def charge(days_rented)
    result = 0
    result += days_rented * 3
  end
end

class ChildrenPrice
  include DefaultPrice

  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
  end
end

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

