require './player.rb'
require './game.rb'

initial_lives = 3

playerOne = Player.new(1, initial_lives)
playerTwo = Player.new(2, initial_lives)

game_settings = {
  min: 1,
  max: 20
}

game = Game.new(playerOne, playerTwo, game_settings)
game.start