require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'dollar'

Minitest::Reporters.use!

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Dollar.new 5
    five.times(2)
    assert_equal 10, five.amount
  end
end

