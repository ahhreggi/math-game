# A question in a turn
class Question

  # Initialize a question and its answer with the given min and max values
  def initialize(min, max)
    @min = min
    @max = max
    @values = self.generate_values
    @answer = self.answer
  end

  # Return true if the given answer is correct, false otherwise
  def is_correct?(answer)
    self.answer.to_s == answer
  end

  # Return the question as a formatted string
  def question
    num1, num2 = self.values
    "What does #{num1} plus #{num2} equal?"
  end

  # Return the answer of the question
  def answer
    add(*@values)
  end

  protected

  attr_reader :values, :min, :max

  def generate_values
    first = get_random(@min, @max)
    second = get_random(@min, @max)
    [first, second]
  end

  # Return a random number within the min and max values
  def get_random(min, max)
    rand(min..max)
  end

  # Return the sum of two given numbers
  def add(num1, num2)
    num1 + num2
  end

end