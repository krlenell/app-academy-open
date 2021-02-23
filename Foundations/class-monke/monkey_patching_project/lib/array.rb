# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    return self.max - self.min
  end

  def average
    return nil if self.length  == 0
    self.sum / (self.length * 1.0)
  end

  def median
    sorted = self.sort
    length = self.length
    if self.length == 0
      nil
    elsif length % 2 == 1
      sorted[length / 2]
    else length % 2 == 0
      [sorted[length / 2], sorted[length / 2 - 1]].sum / 2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash
  end

  def my_count(value)
    count = 0
    self.each {|ele| count += 1 if ele == value}
    count
  end

  def my_index(value)
    self.each_with_index {|ele, idx| return idx if ele == value}
    nil
  end

  def my_uniq
    hash = {}
    self.each {|ele| hash[ele] = true}
    hash.keys
  end

  def my_transpose
    res = []

    self.each_with_index do |inner, idx|
      row = []

      self.each_with_index do |ele, idx2|
        row << self[idx2][idx]
      end

      res << row
    end

    res
  end
end
