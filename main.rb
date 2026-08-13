# frozen_string_literal: true

require 'colorize'

require_relative 'lib/breaker'
require_relative 'lib/board'
require_relative 'lib/game'

game = Game.new
game.print_intro
game.create_code

guess = game.read_user_code
p game.make_guess(guess)
