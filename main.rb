require_relative 'models/player.rb'
require_relative 'models/game.rb'

def is_number(string)
  !!(string =~ /\A[-+]?[0-9]+\z/)
end

# Prompt user for player names and game settings
puts "Welcome to the 2-Player Math Game!"
print "Enter Player 1's name > "
p1_name = gets.chomp
print "Enter Player 2's name > "
p2_name = gets.chomp

is_valid_lives = false
while !is_valid_lives
  print "How many lives should each player have? (minimum: 1, recommended: 3) > "
  initial_lives = gets.chomp
  is_valid_lives = is_number(initial_lives) && initial_lives.to_i > 0
end
initial_lives = initial_lives.to_i

is_valid_min = false
while !is_valid_min
  print "Enter the min value to use to generate questions (recommended: 1) > "
  min = gets.chomp
  is_valid_min = is_number(min)
end
min = min.to_i

is_valid_max = false
while !is_valid_max
  print "Enter the max value to use to generate questions (recommended: 20) > "
  max = gets.chomp
  is_valid_max = is_number(max) && max.to_i >= min
  if max.to_i < min
    puts "Max value must be greater than min value!"
  end
end
max = max.to_i

playerOne = Player.new(p1_name, initial_lives)
playerTwo = Player.new(p2_name, initial_lives)

game = Game.new(playerOne, playerTwo, min, max)
game.start