import static junit.framework.Assert.*;
import junit.framework.TestCase;

public class MoneyTest extends TestCase {
  // Test methods go here

  public void testMultiplication() {
    Money five = Money.dollar(5);
    assertEquals(Money.dollar(10), five.times(2));
    assertEquals(Money.dollar(15), five.times(3));
  }

  public void testEquality() {
    assertTrue(Money.dollar(5).equals(Money.dollar(5)));
    assertFalse(Money.dollar(5).equals(Money.dollar(6)));
    assertFalse(Money.franc(5).equals(Money.dollar(5)));
  }

  public void testCurrency() {
    assertEquals("USD", Money.dollar(1).currency());
    assertEquals("CHF", Money.franc(1).currency());
  }

  public void testSimpleAddition() {
    Money sum = Money.dollar(5).plus(Money.dollar(5));
    assertEquals(Money.dollar(10), sum);
  }

  public void testSimpleAddition() {
    Expression sum = five.plus(five);
    Bank bank = new Bank();
    Money reduced = bank.reduce(sum, "USD");
    assertEquals(Money.dollar(10), reduced);
  }
}
