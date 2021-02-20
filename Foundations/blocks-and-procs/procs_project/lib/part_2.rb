def reverser(str, &prc)
  prc.(str.reverse)
end

def greater_proc_value(num, prc1, prc2)
  [prc1.call(num), prc2.call(num)].max
end

def word_changer(str, &prc)
  res = []
  str.split(' ').each do |word|
    res << prc.call(word)
  end
  res.join(' ')
end

def and_selector(arr, prc1, prc2)
  res = []
  arr.each do |i|
    res << i if prc1.call(i) && prc2.call(i)
  end
  res
end

def alternating_mapper(arr, prc1, prc2)
  res = []
  arr.each_with_index do |ele, i|
    if i.even?
      res << prc1.call(ele)
    else
      res << prc2.call(ele)
    end
  end
  res
end
