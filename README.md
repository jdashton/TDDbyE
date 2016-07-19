# TDDbyE
Code samples from Test-Driven Development by Example, in various languages

For the moment, here are notes on the commands needed to compile and run our example files. For now,
I'll assume that the actual implementation starts off in `Dollar.java`, and the tests in `MoneyTest.java`.

To build the test file (which depends on JUnit):
 * `javac -cp .:junit-3.8.2.jar MoneyTest.java`

To run the test file (after you get it to build):
 * `java -cp .:junit-3.8.2.jar junit.swingui.TestRunner MoneyTest`  for the GUI test-runner, or
 * `java -cp .:junit-3.8.2.jar junit.textui.TestRunner MoneyTest`  for the non-GUI version

To build the implementation:
 * `javac Dollar.java`


