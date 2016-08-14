class Money

  private

  @amount = 0

  public

  def == (money)
    @amount == money.amount && self.class == money.class
  end

  def self.dollar (amount)
    Dollar.new(amount)
  end

  protected

  attr_reader :amount

end
