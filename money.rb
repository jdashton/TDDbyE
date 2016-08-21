class Money

  attr_reader :currency

  def initialize (amount, currency)
    @amount = amount
    @currency = currency
  end

  def == (money)
    @amount == money.amount && @currency == money.currency
  end

  def self.dollar(amount)
    Dollar.new amount, 'USD'
  end

  def self.franc(amount)
    Franc.new amount, 'CHF'
  end

  def inspect
    "#{@amount} #{@currency}"
  end

  protected

  attr_reader :amount
  @amount = 0
  @currency = ''

end
