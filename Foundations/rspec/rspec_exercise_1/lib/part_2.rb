def hipsterfy(str)
  vowel = 'aeiou'

  i = str.length - 1
  while i > 0
    if vowel.include?(str[i])
      return str[0...i] + str[i + 1..-1]
    end
    i -= 1
  end
  str
end

def vowel_counts(str)
  counts = Hash.new(0)
  vowel = 'aeiou'
  str.downcase.each_char do |char|
    if vowel.include?(char)
      counts[char] += 1
    end
  end
  counts
end

def caesar_cipher(word, num)
  alphabet = ("a".."z").to_a
  new_msg = ''

  word.each_char do |char|
    old_idx = alphabet.index(char)
    if old_idx
      new_idx = old_idx + num
      new_msg << alphabet[new_idx % 26]
    else
      new_msg << char
    end
  end
  new_msg
end
