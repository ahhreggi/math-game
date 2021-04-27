require "./player.rb"
require "./turn.rb"

# A Math game
class Game

  # Initialize a math game with the given configurations
  # @param playerOne [Player] - A Player
  # @param playerTwo [Player] - A Player
  # @param settings [{max: Integer, min: Integer}] - Min/max values for question values
  def initialize(playerOne, playerTwo, settings = {min: 1, max: 20})
    @playerOne = playerOne
    @playerTwo = playerTwo
    @min = settings[:min]
    @max = settings[:max]
    @currentPlayer = rand(0..1) == 1 ? @playerOne : @playerTwo
  end

  # Start the game
  def start
    game_over = false
    display_header = true

    while !game_over
      # Get the next turn
      turn = self.next_turn(self.currentPlayer)
      # Display a NEW GAME/NEW TURN header
      if display_header
        puts "A new game has started!"
        display_header = false
        self.divider
      end
      # Ask the current player a question and validate their response
      turn.prompt
      # Display both players' scores and lives
      self.divider
      self.display_status
      self.divider

      # End the game if the current player has no more lives
      if !self.currentPlayer.has_lives?
        game_over = true
      end

      # Set the current player to be the other player
      self.currentPlayer=(self.currentPlayer == self.playerOne ? self.playerTwo : self.playerOne)
    end

    # Once the game ends, announce the current player as the winner
    puts "#{currentPlayer.id} wins with a score of #{currentPlayer.score}"
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

  # Print a divider
  def divider
    puts "-" * 70
  end

  # Display both players' scores and lives
  def display_status
    puts self.playerOne.status
    puts self.playerTwo.status
  end

end