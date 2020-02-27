from TestCase import TestCase
from WasRun import WasRun, BadSetUp
from TestResult import TestResult

class TestCaseTest(TestCase):
  def setUp(self):
    pass

  def testTemplateMethod(self):
    test= WasRun("testMethod")
    test.run()
    assert("setUp testMethod tearDown " == test.log)

  def testResult(self):
    test= WasRun("testMethod")
    result= test.run()
    assert("1 run, 0 failed" == result.summary())

  def testFailedResult(self):
    test= WasRun("testBrokenMethod")
    result= test.run()
    assert("1 run, 1 failed" == result.summary())

  def testFailedResultFormatting(self):
    result= TestResult()
    result.testStarted()
    result.testFailed()
    assert("1 run, 1 failed" == result.summary())

  def testExceptionInSetup(self):
    print("allocating BadSetUp")
    test= BadSetUp("testMethod")
    print("ready to run")
    result= test.run()
    print("ran")
    print(result.summary())
    assert("1 run, 1 failed" == result.summary())

print(TestCaseTest("testTemplateMethod").run().summary())
print(TestCaseTest("testResult").run().summary())
print(TestCaseTest("testFailedResult").run().summary())
print(TestCaseTest("testFailedResultFormatting").run().summary())
print(TestCaseTest("testExceptionInSetup").run().summary())
