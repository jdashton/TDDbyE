import static junit.framework.Assert.*;
import junit.framework.TestCase;

public class MoneyTest extends TestCase {
  // Test methods go here

  public void testMultiplication() {
    Dollar five= new Dollar(5);
    five.times(2);
    assertEquals(10, five.amount);
  }
}
