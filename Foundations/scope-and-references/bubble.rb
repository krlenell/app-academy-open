require 'byebug'

def bubble_sort(array)
  sorted = false
  debugger

  while !sorted
      sorted = true

      (0...array.length - 1).each do |i|
          if array[i] > array[i + 1]
              array[i], array[i + 1] = array[i + 1], array[i]
              sorted = false
          end
      end
  end

  array
end

easy_array = [2,8,5,3,6]
array = [2,8,5,2,6]

print bubble_sort array
puts
