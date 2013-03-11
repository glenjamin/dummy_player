require 'set'

class Player
  def name
    "Glen & Dan"
  end

  ALPHABET = 'etaoinshrdlcumwfgypbvkjxqz'.split(//)

  def take_turn(state, guesses)
    words = valid_words(state)
    sorted_alphabet = sort(words)

    (sorted_alphabet - guesses).shift
  end

  def wordlist
    @wordlist ||= File.readlines(File.expand_path("../354984si.ngl", __FILE__)).select do |w|
      w =~ /^\w+$/
    end
  end

  def valid_words(state)
    regex = Regexp.new("^#{state.gsub(/_/, '.')}$")
    wordlist.select do |word|
      word.length == state.length and regex.match(word)
    end
  end

  def sort(words)
    freqs = Hash.new(0)
    words.each do |word|
      word.strip.downcase.split(//).each do |letter|
        freqs[letter] += 1
      end
    end
    letters = freqs.each_pair.sort_by { |p| p[1] }.reverse.map { |p| p[0] }
    letters + (ALPHABET - letters)
  end
end
