# frozen_string_literal: true

# Board class stores guesses and the code
class Board
  attr_accessor :code

  def initialize
    @code = Array.new(4)
    @guesses = Array.new(10)
    @guesses.map! { Array.new(4) }
  end
end
