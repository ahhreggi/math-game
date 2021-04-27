require "./player.rb"
require "./turn"
require "./question.rb"

# A Math game
class Game

  # Initialize a math game with the given configurations
  # @param initial_lives - The number of lives each player begins with
  # @param min - The lower range limit to use when generating questions
  # @param max - The upper range limit to use when generating questions
  def initialize(initial_lives = 3, min = 1, max = 20)
    @playerOne = Player.new(1, initial_lives)
    @playerTwo = Player.new(2, initial_lives)
    @min = min
    @max = max
    @currentPlayer = rand(0..1) == 1 ? @playerOne : @playerTwo
  end

  # Start the game
  def start
    game_over = false

    while !game_over
      # Ask the current player a question and validate their response
      self.next_turn(self.currentPlayer)
      # Display both players' scores and lives
      puts self.playerOne.status
      puts self.playerTwo.status

      # Set the current player to be the other player
      currentPlayer=(self.currentPlayer == self.playerOne ? self.playerTwo : self.playerOne)

      # End the game if the current player has no more lives
      if self.currentPlayer.has_lives?
        game_over = true
      end
    end

    # Once the game ends, announce the current player as the winner
    puts "Player #{currentPlayer.id} wins with a score of #{currentPlayer.score}"
    puts "----- GAME OVER -----"
    puts "Thanks for playing!"
  end

  protected

  attr_accessor :currentPlayer
  attr_reader :playerOne, :playerTwo, :min, :max

  # Get the next turn for the given player
  def next_turn(player)
    Turn.new(player, self.min, self.max)
  end

end