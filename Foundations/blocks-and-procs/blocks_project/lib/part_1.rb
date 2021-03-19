def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |dog| dog['age'] < 3 }
end

def count_positive_subarrays(arrays)
  arrays.count { |array| array.sum > 0 }
end

def aba_translate(word)
  vowels = %w[a e i o u]
  new_word = ''
  word.each_char do |char|
    new_word += if vowels.include?(char)
                  (char + 'b' + char)
                else
                  char
                end
  end
  new_word
end

def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end
