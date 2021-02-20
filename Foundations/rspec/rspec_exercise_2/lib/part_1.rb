def partition(arr, num)
  less = []
  greater = []

  arr.each do |ele|
    if ele < num
      less << ele
    else
      greater << ele
    end
  end
  [less, greater]
end
