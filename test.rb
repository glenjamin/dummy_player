require './players/player'

@words = File.readlines('/usr/share/dict/words')

def random_word
  @words.sample.downcase
end

@player = Player.new
word = "____"
answer = random_word
guesses = []
while word != answer and guesses.length <= 26
  guess = @player.take_turn(word, guesses)
  guesses << guess
  word.split(//).each_with_index do | letter, i |
    if letter == guess
      word[i] = letter
    end
  end
end

puts word
puts answer
puts guesses
