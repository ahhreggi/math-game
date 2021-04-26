class Question

  # Initialize a question and its answer with the given min and max values
  def initialize(min = 1, max = 20)
    @values = self.generate_values
    @answer = self.answer
    @min = min
    @max = max
  end

  # Return true if the given answer is correct, false otherwise
  def is_correct?(answer)
    self.answer === answer
  end

  # Return a string representation of the question values
  def question
    num1, num2 = self.values
    "What does #{num1} plus #{num2} equal?"
  end

  # Return the answer of the question
  def answer
    add(*self.values)
  end

  protected

  attr_reader :values, :min, :max

  # Generate a question value pair
  def generate_values
    first = generate_number(self.min, self.max)
    second = generate_number(self.min, self.max)
    [first, second]
  end

  # Return a random number within the given min and max values
  def generate_number(min, max)
    rand(1..20)
  end

  # Return the sum of two given numbers
  def add(num1, num2)
    num1 + num2
  end

end