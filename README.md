# TDDbyE
## Code samples from _Test-Driven Development by Example_, in various languages

### This version of `README.md` is associated with the Java branch and implementation.

Here are notes on the commands needed to compile and run our example files. For now,
I'll assume that the actual implementation starts off in `Dollar.java`, and the 
tests in `MoneyTest.java`.

To build the test file (which depends on JUnit):
 * `javac -cp .:junit-3.8.2.jar MoneyTest.java`

To run the test file (after you get it to build):
 * `java -cp .:junit-3.8.2.jar junit.swingui.TestRunner MoneyTest`  for the GUI test-runner, or
 * `java -cp .:junit-3.8.2.jar junit.textui.TestRunner MoneyTest`  for the non-GUI version

To build the implementation:
 * `javac Dollar.java`

When you start the chapter, the following shell of `MoneyTest.java` is the first file to modify:
```java
import static junit.framework.Assert.*;
import junit.framework.TestCase;

public class MoneyTest extends TestCase {
  // Test methods go here

}
```

`Dollar.java` can start empty.

Be aware that the four compile errors the author mentions on page 5
do not appear with these wordings with a modern Java compiler. However, the four steps he outlines
still apply, and I suggest adding the code snippets in that order and compiling after each thing
you add to get a sense of the micro-steps you can take to move toward a passing test. Adding curly
braces after `class Dollar` is probably beneficial, too.


