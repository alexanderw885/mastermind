# frozen_string_literal: true

# Contains guessing and code making logic for the computer
class Cpu
  def make_guess
    print "Cpu guessing not implemented\n"
    exit
  end

  def make_code
    code = (1..4).to_a.map { Game.colors[Random.rand(6)] }
    p code
    code
  end
end
