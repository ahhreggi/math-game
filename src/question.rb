class Question

  attr_reader :body, :answer

  def initialize
    @body, @answer = self.generate_question
  end

  protected

  def generate_question
    first = rand(1..20)
    second = rand(1..20)
    question = "What does #{first} plus #{second} equal?"
    answer = first + second
    return question, answer
  end
end