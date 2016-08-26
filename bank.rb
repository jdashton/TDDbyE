
class Bank
  def reduce(source, to)
    return source.reduce(to) if source.instance_of?(Money)
    source.reduce to
  end
end