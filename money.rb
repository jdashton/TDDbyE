class Money

  attr_reader :currency

  private

  @amount = 0
  @currency = ''

  public

  def == (money)
    @amount == money.amount && self.class == money.class
  end

  def self.dollar(amount)
    Dollar.new amount
  end

  def self.franc(amount)
    Franc.new amount, nil
  end

  protected

  attr_reader :amount

end
