require 'set'

class Player
  def name
    "Glen & Dan"
  end

  ALPHABET = 'etaoinshrdlcumwfgypbvkjxqz'.split(//)

  def take_turn(state, guesses)
    (ALPHABET - guesses).shift
  end
end
