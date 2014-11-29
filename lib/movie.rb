class Movie
  REGULAR     = 0     # 普通片
  NEW_RELEASE = 1     # 新片
  CHILDRENS   = 2     # 兒童片

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  def charge(days_rented)
    charge = 0
    # determine amounts for each line
    case price_code
    when Movie::REGULAR
      charge += 2
      charge += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      charge += days_rented * 3
    when Movie::CHILDRENS
      charge += 1.5
      charge += (days_rented - 3) * 1.5 if days_rented > 3
    end
    charge
  end

  def frequent_renter_points(days_rented)
    if price_code == Movie::NEW_RELEASE && days_rented > 1
      2
    else
      1
    end
  end
end

