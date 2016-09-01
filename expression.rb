class Expression
  def reduce(bank, to)
    raise NotImplementedError.
      new "#{self.class.name}#reduce is an abstract method."
  end

  def plus(addend)
    raise NotImplementedError.
      new "#{self.class.name}#plus is an abstract method."
  end

  def times(multiplier)
    raise NotImplementedError.
      new "#{self.class.name}#times is an abstract method."
  end
end