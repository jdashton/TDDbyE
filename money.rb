class Money

  public

  def == (money)
    @amount == money.amount && self.class == money.class
  end

  protected

  attr_reader :amount

  private

  @amount = 0

end
