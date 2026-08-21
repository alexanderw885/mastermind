# frozen_string_literal: true

# Board class stores guesses and the code
class Board
  attr_accessor :code, :guesses

  def initialize
    @code = Array.new(4)
    @guesses = []
  end

  def compare(guess, code = @code)
    # In order to preserve the original array, create local copies
    local_code = code.map { |c| c[0] }
    local_guess = guess.map { |c| c[0] }

    output = Hash.new(0)
    output[:exact] = count_exact_match(local_guess, local_code)
    output[:part] = count_part_match(local_guess, local_code)
    output
  end

  def count_exact_match(guess, code)
    out = 0
    (0..3).reverse_each do |i|
      next unless code[i] == guess[i]

      code.delete_at(i)
      guess.delete_at(i)
      out += 1
    end
    out
  end

  def count_part_match(guess, code)
    out = 0
    guess.each do |c|
      match = code.index(c)
      if match
        out += 1
        code.delete_at(match)
      end
    end
    out
  end

  def add_guess(guess)
    @guesses.append(guess)
  end

  def print_guesses
    out = "Guesses    Results\n"
    @guesses.each do |guess|
      out += guess_to_string(guess[:guess])
      out += '    '
      out += results_to_string(guess[:results])
      out += "\n"
    end
    print out
  end

  def guess_to_string(guess)
    out = ''
    guess.each do |col|
      out += '■ '.colorize(col.to_sym)
    end
    out
  end

  def results_to_string(results)
    out = ''
    results[:exact].times do
      out += '■ '.colorize(:red)
    end
    results[:part].times do
      out += '■ '.colorize(:white)
    end
    out
  end
end
