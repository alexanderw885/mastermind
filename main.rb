# frozen_string_literal: true

require 'colorize'

require_relative 'lib/board'
require_relative 'lib/game'

game = Game.new
game.print_intro
game.create_code

winner = false
until winner
  guess = game.read_user_code
  game.make_guess(guess)
  winner = game.over?
end

print "The winner is the code #{winner}!!!\n"
