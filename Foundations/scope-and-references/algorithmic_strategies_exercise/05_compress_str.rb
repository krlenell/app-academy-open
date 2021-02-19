# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  res = ''
  char_arr = str.split ''
  char_arr.each_with_index do |ele, i|
    if char_arr[i + 1] && ele != char_arr[i + 1]
      res << ele
      char_arr.shift
    end
  end
  res
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
