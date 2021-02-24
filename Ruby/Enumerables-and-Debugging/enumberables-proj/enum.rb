class Array

  def my_each(&proc)
    self.length.times do |i|
      proc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    res = []
    self.length.times do |i|
      res << self[i] if prc.call(self[i])
    end
    res
  end

  def my_reject(&prc)
    res = []
    self.length.times do |i|
      res << self[i] if !prc.call(self[i])
    end
    res
  end

  def my_any?(&prc)
    self.my_each do |i|
      return true if prc.call(i)
    end
    false
  end

end
