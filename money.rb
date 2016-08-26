require_relative 'expression'

class Money < Expression

  attr_reader :currency

  def initialize (amount, currency)
    @amount   = amount
    @currency = currency
  end

  def == (money)
    @amount == money.amount && @currency == money.currency
  end

  def times (multiplier)
    Money.new (@amount * multiplier), @currency
  end

  def plus (addend)
    Sum.new self, addend
  end

  def self.dollar(amount)
    Money.new amount, 'USD'
  end

  def self.franc(amount)
    Money.new amount, 'CHF'
  end

  def inspect
    "#{@amount} #{@currency}"
  end

  def reduce (bank, to)
    rate = bank.rate currency, to
    Money.new amount / rate, to
  end

  attr_reader :amount

  protected

  @amount   = 0
  @currency = ''

end
