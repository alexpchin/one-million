class Fixnum

  # Recursive method to print out word.
  # If the number is in range (1 - 1000000):
  # - Check if number is a unique string, in_a_word
  # - If not, then calculate string of words, in_many_words
  def in_words
    in_a_word || in_many_words if in_range?
  end

  def digits
    self.to_s.length
  end

  private

  # Check if number is between one and one million.
  def in_range?
    self > LOWER_BOUND && self <= UPPER_BOUND
  end

  # If the number is a unique value, take directly from the WORDS hash
  def in_a_word
    WORDS[self]
  end

  # Check if the number is round a multiple of a magnitude
  # If it is not, then 
  def in_many_words
    (self % magnitude == 0) ? multiple_of_magnitude_in_words : long_number_in_words
  end

  # Order of magnitude followed but the magnitude word.
  # The reason I have monkey-patched Fixnum is so that I can use in_words recursively
  # E.g. (four thousand) (three hundred) = 2 recursions
  def multiple_of_magnitude_in_words
    [(self / magnitude).in_words, magnitude_word].join(' ')
  end

  # E.g. (four thousand) (three hundred) and (twenty) (two) = 4 recursions
  def long_number_in_words
    magnitude_part_and_remainder.map(&:in_words).join(magnitude_separator)
  end

  # Returns an array containing the order of magnitude and remainder.
  def magnitude_part_and_remainder
    quotient, remainder = self.divmod(magnitude)
    [magnitude * quotient, remainder]
  end

  # Lookup the magnitude if it is a unique word
  def magnitude_word
    MAGNITUDE[magnitude]
  end

  # Calculate the order of magnitude, e.g. 
  def magnitude
    return 1000 if (4..6).include?(digits)
    10 ** (digits - 1)
  end

  # Choose the correct separator between words
  def magnitude_separator
    (remainder(magnitude) < 100 && magnitude > 10) ? ' and ' : ' '
  end

  LOWER_BOUND = 0
  UPPER_BOUND = 1000000

  WORDS = {
    1  => "one",
    2  => "two",
    3  => "three",
    4  => "four",
    5  => "five",
    6  => "six",
    7  => "seven",
    8  => "eight",
    9  => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  MAGNITUDE = {
    100     => "hundred",
    1000    => "thousand",
    1000000 => "million"
  }

end
