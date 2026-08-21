# frozen_string_literal: true

require 'colorize'

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/human'
require_relative 'lib/cpu'

game = Game.new
game.print_intro

print "Do you want to play the code maker [m] or code breaker [b]? [m/b]\n"

maker = nil
breaker = nil
loop do
  input = gets.chomp.downcase
  case input
  when 'm'
    maker = Human.new
    breaker = Cpu.new
  when 'b'
    maker = Cpu.new
    breaker = Human.new
  else
    print "Invalid input\n"
    next
  end
  break
end

code = maker.make_code
game.enter_code(code)

winner = false
until winner
  guess = breaker.make_guess
  game.guess(guess)
  winner = game.over?
end

print "The winner is the code #{winner}!!!\n"
