class Dollar

  def initialize amount
    @amount = amount
  end

  def times multiplier
    Dollar.new (@amount * multiplier)
  end

  def == dollar
    @amount == dollar.amount
  end

  protected

  attr_reader :amount
end
