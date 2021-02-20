def all_words_capitalized?(array)
  array.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr)
  valid = %w( com net io org )
  arr.none? do |url|
    suffix = url.split('.')[1]
    valid.include?(suffix)
  end
end

def any_passing_students?(arr)
  arr.any? do |student|
    avg = student[:grades].sum / student[:grades].length
    avg > 74
  end
end
