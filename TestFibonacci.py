from TestCase import TestCase
from TestResult import TestResult
from TestSuite import TestSuite

class TestFibonacci(TestCase):
  def test0(self):
    assert(0 == fib(0))

  def test1(self):
    assert(1 == fib(1))

  def test2(self):
    assert(1 == fib(2))

  def test3(self):
    assert(2 == fib(3))

def fib(n):
  if (n < 2):
    return n
  return fib(n-1) + fib(n-2)

suite= TestSuite()
suite.add(TestFibonacci("test0"))
suite.add(TestFibonacci("test1"))
suite.add(TestFibonacci("test2"))
suite.add(TestFibonacci("test3"))
result= TestResult()
suite.run(result)
print(result.summary())