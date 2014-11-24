One Million (Code Test)
===========

## The challenge

The challenge was to write a Ruby script that outputs every number
from 1 (one) to 1,000,000 (one million), but the output should be in
words.

## My solution

I decided to monkey-patch [Fixnum](http://www.ruby-doc.org/core-2.1.5/Fixnum.html) for this challenge.

I used Ruby 2.1.4 with RSpec for TDD and [Guard](https://github.com/guard/guard) for continuous testing. To run the tests `bundle install` and run `rspec`.

To execute the script and count to a million in words, use:

```
$ ./one_to_a_million
```