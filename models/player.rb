# A player in a math game
class Player

  attr_reader :id

  # Initialize a player with the given id and initial number of lives
  def initialize(id, initial_lives)
    @id = id
    @initial_lives = initial_lives
    @lives = initial_lives
    @score = 0
    @attempts = 0
  end

  # Return true if the player has at least 1 life remaining, false otherwise
  def has_lives?
    self.lives > 0
  end

  # Add 1 to the player's attempts and increment their score if add_score is true,
  # otherwise remove 1 life
  def add_attempt(add_score)
    @attempts += 1
    if add_score
      self.add_score
    else
      self.remove_life
    end
  end

  # Return a string representation of the player's score
  def score
    "#{@score}/#{self.attempts}"
  end

  # Return a string representation of the player's score and lives
  def status
    "#{self.label} Score: #{self.score} | Lives: #{self.lives}/#{self.initial_lives}"
  end

  # Return a string representation of the player's id
  def label
    "[ #{self.id} ]"
  end

  protected

  attr_reader :initial_lives, :lives, :attempts

  # Add 1 to the player's score
  def add_score
    @score += 1
  end

  # Remove 1 life from the player
  def remove_life
    @lives -= 1
  end

end