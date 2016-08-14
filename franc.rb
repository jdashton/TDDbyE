require_relative 'money'

class Franc < Money

  def initialize (amount)
    @amount = amount
  end

  def times (multiplier)
    Franc.new (@amount * multiplier)
  end

  def currency(i, i1)
    # code here
  end
end
