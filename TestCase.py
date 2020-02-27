from TestResult import TestResult

class TestCase:
  def __init__(self, name):
    self.name= name

  def setUp(self):
    pass

  def run(self):
    result= TestResult()
    result.testStarted()
    print("calling setUp")
    try:
      self.setUp()
      print("looking for method")
      method = getattr(self, self.name)
      print("calling method")
      method()
      print("method returned")
    except:
      result.testFailed()
    self.tearDown()
    return result

  def tearDown(self):
    pass
