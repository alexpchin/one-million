class Word

  attr_reader :integer, :word, :digits, :magnitude

  def initialize(integer)
    @integer    = integer                 # 923454
    @digits     = integer.to_s.length     # 6
    @magnitude  = order_of_magnitude      # 100000
    @word       = in_words                # nine hundred and twenty three thousand four hundred and fifty four
  end

  private

  # Recursive method to print out word.
  # If the number is in range (1 - 1000000):
  # - Check if number is a unique string, in_a_word
  # - If not, then calculate string of words, in_many_words
  def in_words
    in_a_word || in_many_words if in_range?
  end

  # If the number is a unique value, take directly from the WORDS hash
  def in_a_word
    WORDS[integer]
  end

  # Is the number a multiple of a magnitude?
  def in_many_words
    multiple_of_magnitude? ? multiple_of_magnitude_in_words : long_number_in_words
  end

  # Integer % magnitude
  def multiple_of_magnitude?
    integer % magnitude == 0
  end

  def in_range?
    integer > LOWER_BOUND && integer <= UPPER_BOUND
  end

  # Order of magnitude followed but the magnitude word.
  def multiple_of_magnitude_in_words
    [(integer / magnitude).in_words, magnitude_word].join(' ')
  end

  # 
  def long_number_in_words
puts " "
puts "integer: #{integer}"
puts "digits: #{digits}"
puts "magnitude: #{magnitude}"
# puts magnitude_part_and_remainder
puts integer.divmod(magnitude).class
    magnitude_part_and_remainder.map(&:in_words).join(magnitude_separator)
  end

  # Returns an array containing the order of magnitude and remainder.
  def magnitude_part_and_remainder
    quotient, remainder = integer.divmod(magnitude)
    [magnitude * quotient, remainder]
  end

  def magnitude_word
    MAGNITUDE[magnitude]
  end

  # Calculate the order of magnitude, e.g. 
  def order_of_magnitude
    # return 1000 if (4..6).include?(digits)
    # 10 ** (digits - 1)
    10 ** digits - 1
  end

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
