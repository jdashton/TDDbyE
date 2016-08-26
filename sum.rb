require_relative 'expression'

class Sum < Expression
  attr_reader :augend
  attr_reader :addend

  def initialize (augend, addend)
    # @augend = augend
    # @addend = addend
  end
end