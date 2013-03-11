require 'set'

class Player
  def name
    "Glen & Dan"
  end

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.split(//)

  def take_turn(state, guesses)
    (Set.new(ALPHABET) - Set.new(guesses)).to_a.sample
  end
end
