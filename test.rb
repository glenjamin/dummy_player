require './players/player'

@words = File.readlines('/usr/share/dict/words')

def random_word
  @words.sample.strip.downcase
end

@player = Player.new
answer = random_word
word = "_" * answer.length
guesses = []
wrong = 0
while word != answer and guesses.length <= 26
  guess = @player.take_turn(word, guesses)
  guesses << guess
  right = false
  answer.split(//).each_with_index do | letter, i |
    if letter == guess
      word[i] = letter
      right = true
    end
  end
  wrong += 1 if not right
  puts [guesses.length, wrong, guess, word].join ' '
end

puts answer
puts wrong
puts guesses.length
