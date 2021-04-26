class Player
  def initialize(name)
    self.name = name
    self.score = 0
    self.lives = 3
  end

  def remove_life
    self.lives -= 1
  end

  def add_score
    self.score += 1
  end
end