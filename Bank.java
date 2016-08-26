class Bank {
  int rate(String from, String to) {
    return (from.equals("CHF") && to.equals("USD"))
      ? 2
      : 1;
  }

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }
}
