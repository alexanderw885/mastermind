# frozen_string_literal: true

require 'colorize'

require_relative 'lib/breaker'
require_relative 'lib/board'
require_relative 'lib/game'

game = Game.new
game.print_intro
game.create_code

2.times do
  guess = game.read_user_code
  game.make_guess(guess)
end
