require_relative 'money'

class Dollar < Money

  def initialize (amount)
    @amount = amount
  end

  def times (multiplier)
    Dollar.new (@amount * multiplier)
  end

  def currency(i, i1)
    # code here
  end
end
