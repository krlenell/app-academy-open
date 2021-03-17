# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if length == 0

    max - min
  end

  def average
    return nil if length == 0

    sum / (length * 1.0)
  end

  def median
    sorted = sort
    length = self.length
    if self.length == 0
      nil
    elsif length.odd?
      sorted[length / 2]
    else
      length.even?
      [sorted[length / 2], sorted[length / 2 - 1]].sum / 2.0
    end
  end

  def counts
    hash = Hash.new(0)
    each { |ele| hash[ele] += 1 }
    hash
  end

  def my_count(value)
    count = 0
    each { |ele| count += 1 if ele == value }
    count
  end

  def my_index(value)
    each_with_index { |ele, idx| return idx if ele == value }
    nil
  end

  def my_uniq
    hash = {}
    each { |ele| hash[ele] = true }
    hash.keys
  end

  def my_transpose
    res = []

    each_with_index do |_inner, idx|
      row = []

      each_with_index do |_ele, idx2|
        row << self[idx2][idx]
      end

      res << row
    end

    res
  end
end
