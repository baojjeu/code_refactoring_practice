class Customer
  attr_reader :name

  def initialize(name)
    @name    = name  # 姓名
    @rentals = []    # 租借紀錄
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount = 0            # 總消費金額
    frequent_renter_points = 0  # 常客積點
    result = "Rental Record for #{@name}\n"

    @rentals.each do |rental|
      # 累加常客積點
      frequent_renter_points += rental.frequent_renter_points

      # 顯示此筆租借資料
      result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
    end

    # 結尾列印
    result += "Amount owed is #{totoal_charge}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  private
    def totoal_charge
      # sum = 0
      # @rentals.each do |rental|
      #   sum += rental.charge
      # end
      # sum

      # is equivalent to:
      @rentals.inject(0) { |sum, rental| sum += rental.charge }
    end
end
