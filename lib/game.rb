# frozen_string_literal: true

# Game stores the game objects and handles logic
class Game
  def initialize
    @breaker = Breaker.new
    @board = Board.new
  end

  def create_code
    4.times { |i| @board.code[i] = Game.colors[Random.rand(6)] }
  end

  def self.colors
    %i[red blue green yellow magenta white]
  end

  def print_intro
    message = "Welcome to Mastermind!\nWe have #{Game.colors.length} colors:\n"
    Game.colors.each { |c| message += "■ #{c}\n".colorize(c) }
    message += "\nThere are also two types of info keys:\n"
    message += "#{'■ white'.colorize(:white)}: 1 guess is the right color, wrong position\n"
    message += "#{'■ red'.colorize(:red)}: 1 guess is the right color, right position\n\n"
    message += "Guess by inputting the first letter of each color\n"
    print message
  end
end
