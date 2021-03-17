def my_map(arr, &block)
  res = []

  arr.each do |i|
    res << block.call(i)
  end

  res
end

def my_select(arr, &prc)
  res = []

  arr.each do |i|
    res << i if prc.call(i)
  end
  res
end

def my_count(arr, &prc)
  res = 0
  arr.each do |i|
    res += 1 if prc.call(i)
  end
  res
end

def my_any?(arr, &prc)
  arr.each do |i|
    return true if prc.call(i)
  end
  false
end

def my_all?(arr, &prc)
  arr.each do |i|
    return false unless prc.call(i)
  end
  true
end

def my_none?(arr, &prc)
  arr.each do |i|
    return false if prc.call(i)
  end
  true
end
