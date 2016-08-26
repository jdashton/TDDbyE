
class Money implements Expression {

  static Money dollar(int amount) {
    return new Money(amount, "USD");
  }

  static Money franc(int amount) {
    return new Money(amount, "CHF");
  }

  protected int amount;
  protected String currency;

  Money(int amount, String currency) {
    this.amount = amount;
    this.currency = currency;
  }

  public boolean equals(Object object) {
    Money money = (Money) object;
    return amount == money.amount
      && currency().equals(money.currency());
  }

  Money times(int multiplier) {
    return new Money(amount * multiplier, currency);
  }

  Expression plus(Expression addend) {
    return new Sum(this, addend);
  }

  String currency() {
    return currency;
  }

  public String toString() {
    return amount + " " + currency;
  }

  public Money reduce(Bank bank, String to) {
    int rate = bank.rate(currency, to);
    return new Money(amount / rate, to);
  }
}
