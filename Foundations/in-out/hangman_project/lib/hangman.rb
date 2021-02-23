class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end


  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index do |curr, i|
      indices << i if curr == char
    end
    indices
  end

  def fill_indices(char, indices_arr)
    indices_arr.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      indices = self.get_matching_indices(char)
      if indices.length == 0
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, indices)
      end
      true
    end
  end

  def ask_user_for_guess
    print "Enter a char:"
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if self.lose? || self.win?
      p @secret_word
      true
    else
      false
    end
  end
end
