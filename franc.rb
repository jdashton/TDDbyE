class Franc

  def initialize amount
    @amount = amount
  end

  def times multiplier
    Franc.new (@amount * multiplier)
  end

  def == franc
    @amount == franc.amount
  end

  protected

  attr_reader :amount
end
