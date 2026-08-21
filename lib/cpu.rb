# frozen_string_literal: true

# Contains guessing and code making logic for the computer
class Cpu
  def initialize
    @valid_codes = init_codes
    @total_codes = @valid_codes.length
    @remaining_codes = @total_codes
  end

  def make_guess
    return make_first_guess if @total_codes == @remaining_codes

    @valid_codes[0]
  end

  def make_code
    (1..4).to_a.map { Game.colors[Random.rand(6)] }
  end

  def take_feedback(guess)
    return if guess[:results][:exact] == 4

    test_board = Board.new
    @valid_codes.select! do |code|
      same_result?(guess[:results], test_board.compare(guess[:guess], code))
    end
    @remaining_codes = @valid_codes.length
    print "Remaining possibilities: #{@remaining_codes}\n\n"
  end

  def make_first_guess
    c = Game.colors
    [c[0], c[0], c[1], c[1]]
  end

  def same_result?(real, test)
    real[:exact] == test[:exact] && real[:part] == test[:part]
  end

  def init_codes
    Game.colors.map { |c| c[0] }.repeated_permutation(4).to_a
  end
end
