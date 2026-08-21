# frozen_string_literal: true

# Game stores the game objects and handles logic
class Game
  attr_accessor :num_turns, :curr_turn

  def initialize
    @board = Board.new
    make_color_aliases(Game.colors)
    @num_turns = 10
    @curr_turn = 0
  end

  def enter_code(code)
    @board.code = code
  end

  # def create_code
  #   4.times { |i| @board.code[i] = Game.colors[Random.rand(6)] }
  #   p @board.code
  # end

  def guess(guess)
    results = @board.compare(guess)
    guess_with_results = {
      guess: guess,
      results: results
    }
    @board.add_guess(guess_with_results)
    @board.print_guesses
    self.curr_turn += 1
  end

  def over?
    return :maker if curr_turn >= num_turns

    last_guess = @board.guesses.dig(-1, :results, :exact)
    return false if last_guess.nil?

    return :breaker if last_guess == 4

    false
  end

  def print_intro
    message = "Welcome to Mastermind!\nWe have #{Game.colors.length} colors:\n"
    Game.colors.each { |col| message += "■ #{col}\n".colorize(col) }
    message += "\nThere are also two types of info keys:\n"
    message += "#{'■ white'.colorize(:white)}: 1 guess is the right color, wrong position\n"
    message += "#{'■ red'.colorize(:red)}: 1 guess is the right color, right position\n\n"
    message += "Guess by inputting the first letter of each color (e.g. \"R R B M\")\n"
    print message
  end

  def self.colors
    %i[red blue green yellow magenta white]
  end
end

def make_color_aliases(colors)
  colors.each do |c|
    String.add_color_alias(c[0].to_sym, c)
  end
end
