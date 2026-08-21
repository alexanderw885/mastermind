# frozen_string_literal: true

# Contains guessing and code making logic for the player
class Human
  def validate_code(code)
    valid_colors = Game.colors.map { |c| c[0] }
    unless code.length == 4
      print "Invalid code length: Should be 4 colors\n"
      return false
    end
    unless (code - valid_colors).empty?
      print "Invalid colors: #{(code - valid_colors).uniq}\n"
      return false
    end
    true
  end

  def read_user_code
    valid_guess = false
    until valid_guess
      print "Enter your code:\n"
      input = gets.downcase.chomp.split(' ')
      valid_guess = validate_code(input)
    end
    input
  end

  alias make_guess read_user_code
  alias make_code read_user_code
end
