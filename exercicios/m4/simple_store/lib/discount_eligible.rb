module DiscountEligible
  def has_discount?
    @days_to_expire >= 0 && @days_to_expire <= 30
  end

  def discount_percentage
    if has_discount?
      -(0.6/30) * @days_to_expire + 0.6
    else
      0
    end
  end

  #
  # @return [Fixnum] The number of days until the product expiration date.
  #
  def days_to_expire
    # TODO
    @days_to_expire = (Date.parse(@expiration_date) - Date.today).to_i
  end

  #
  # @return [Float] The amount of discount, with at most 2 decimal places.
  #
  def discount_amount
    if has_discount?
      puts "price total: #{@price} discount_percentage: #{discount_percentage}"
      res ='%.2f' % (@price * discount_percentage).to_f
      puts "discount_amount: #{res}"
      res.to_f
    else
      nil
    end
  end

  #
  # @return [Float] the price of the product considering the discount_amount.
  # The value must be rounded to at most 2 decimal places.
  #
  def discounted_price
    if (@price != nil && @price > 0)
      ('%.2f' % (@price - self.discount_amount)).to_f
    else
      faile SimpleStore::Error, 'O preço do produto deve ser > que 0.0'
    end
  end
end
