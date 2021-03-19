# primes.rb

def prime?(num)
  (2...num).each do |idx|
    return false if num % idx == 0
  end
  true
end

def primes(num_primes)
  ps = []
  num = 1
  ps << num if prime?(num) while ps.count < num_primes
end

puts primes(100) if __FILE__ == $PROGRAM_NAME
