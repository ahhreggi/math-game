require "./question.rb"

# A turn in a math game
class Turn

  # Initialize a question for the given Player
  def initialize(player, min, max)
    @player = player
    @question = Question.new(min, max)
  end

  # Prompt the player with the question and validate the answer
  def prompt
    # Ask the player the question
    puts "#{@player.label} #{@question.question}"
    # Prompt for user input
    print "> "
    response = gets.chomp
    # Validate response and record attempt
    is_correct = @question.is_correct?(response)
    # Increment the player's score/lives as required
    @player.add_attempt(is_correct)
    # Print a result message
    puts is_correct ? "Correct! ✔️" : "Incorrect! ❌"
  end

end