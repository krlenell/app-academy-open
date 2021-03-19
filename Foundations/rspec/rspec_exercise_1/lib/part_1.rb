def average(a, b)
  (a + b) / 2.0
end

def average_array(arr)
  length = arr.length.to_f
  sum = arr.inject { |acc, i| acc + i }
  sum / length
end

def repeat(str, num)
  res = ''
  num.times { res << str }
  res
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(str)
  str = str.downcase
  arr = str.split ' '
  new_arr = []
  arr.each_with_index do |word, i|
    new_arr << if i.even?
                 word.upcase
               else
                 word
               end
  end
  new_arr.join ' '
end
