require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'money'
require_relative 'bank'
require_relative 'sum'
require_relative 'expression'

Minitest::Reporters.use!

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Money.dollar 5
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_equality
    assert Money.dollar(5) == Money.dollar(5)
    assert Money.dollar(5) != Money.dollar(6)
    assert Money.franc(5) != Money.dollar(5)
  end

  def test_currency
    assert_equal 'USD', Money.dollar(1).currency
    assert_equal 'CHF', Money.franc(1).currency
  end

  def test_simple_addition
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce sum, 'USD'
    assert_equal Money.dollar(10), reduced
  end

  def test_plus_returns_sum
    five = Money.dollar 5
    result = five.plus five
    sum = result
    assert_equal five, sum.augend
    assert_equal five, sum.addend
  end

  def test_reduce_sum
    sum = Sum.new Money.dollar(3), Money.dollar(4)
    bank = Bank.new
    result = bank.reduce sum, 'USD'
    assert_equal Money.dollar(7), result
  end

  def test_reduce_money
    bank = Bank.new
    result = bank.reduce Money.dollar(1), 'USD'
    assert_equal Money.dollar(1), result
  end
end