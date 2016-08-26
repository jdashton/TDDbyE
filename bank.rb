
class Bank
  def reduce(source, to)
    source.reduce self, to
  end

  def addRate(i, i1, i2)
    # code here
  end

  def rate(from, to)
    from == 'CHF' && to == 'USD' ? 2 : 1
  end

  private

  @rates = Hash.new

end