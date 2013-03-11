require './players/player'

@words = File.readlines('/usr/share/dict/words')

def random_word
  @words.sample.strip.downcase
end

@player = Player.new
answer = random_word
word = "_" * answer.length
guesses = []
while word != answer and guesses.length <= 26
  guess = @player.take_turn(word, guesses)
  guesses << guess
  answer.split(//).each_with_index do | letter, i |
    if letter == guess
      word[i] = letter
    end
  end
end

puts answer
puts guesses.length
