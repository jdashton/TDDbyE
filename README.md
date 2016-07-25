# TDDbyE
## Code samples from Test-Driven Development by Example, in various languages

### This version of `README.md` is associated with the Ruby branch and implementation.

I'm running this with Ruby 2.3.1, but the code is so generic that it will
probably be compatible with pretty much any version of Ruby you may have.

The author of Minitest recommends that you install the current version of Minitest,
rather than relying on the one that gets included with your version of Ruby. To
install the current version, use `gem install minitest`.

After getting the first test to run (and fail) rather than err, I found that
the default test reporter for MiniTest has no color. To get color, I installed
the minitest-reporters gem, with `gem install minitest-reporters`. I also
added the necessary code to the top of `money_test.rb`.

The tests are in `money_test.rb`, and the implementation in `dollar.rb`.

To run the test:
 * `ruby money_test.rb`


