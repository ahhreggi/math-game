require "./question.rb"

# A turn in a math game
class Turn

  # Initialize a question for the given Player
  def initialize(player)
    @player = player
    @question = Question.new
  end

  # Prompt the player with the question and validate the answer
  def prompt
    puts "----- NEW TURN -----"
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
    print @player.label
    puts is_correct ? " ✔️ Correct!" : " ❌ Incorrect!"
  end

end