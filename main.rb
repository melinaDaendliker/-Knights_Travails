require_relative 'lib/game.rb'
require_relative 'lib/knight.rb'

game = Game.new
game_borad = game.create_board
p game_borad
p knight = Knight.new([4,6], game_borad)
knight.allowed_moves