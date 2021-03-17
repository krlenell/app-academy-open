class Array
  def my_each(&proc)
    length.times do |i|
      proc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    res = []
    length.times do |i|
      res << self[i] if prc.call(self[i])
    end
    res
  end

  def my_reject(&prc)
    res = []
    length.times do |i|
      res << self[i] unless prc.call(self[i])
    end
    res
  end

  def my_any?(&prc)
    my_each do |i|
      return true if prc.call(i)
    end
    false
  end

  def my_flatten
    flattened = []

    my_each do |el|
      if el.is_a?(Array)
        flattened.concat(el.flatten)
      else
        flattened << el
      end
    end

    flattened
  end

  def my_zip(*arrays)
    zip = []

    length.times do |i|
      subarray = [self[i]]

      arrays.my_each do |array|
        subarray << array[i]
      end

      zip << subarray
    end
    zip
  end

  # pretty sure this is wrong
  def my_rotate(pos = 1)
    split = pos % length

    drop(split) + take(split)
  end

  def my_join(char = '')
    res = (self[0]).to_s

    (1..length).each do |i|
      res += char
      res += self[i]
    end
    res
  end

  def my_reverse
    res = []
    my_each do |el|
      res.unshift el
    end
    res
  end
end
