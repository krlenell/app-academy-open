require 'part_1'

describe 'Part 1:' do
  describe 'average' do
    it 'accepts two numbers as arguments' do
      expect { average(4, 8) }.not_to raise_error
    end

    it 'returns the average of the two numbers' do
      expect(average(4, 8)).to eq(6)
      expect(average(5, 10)).to eq(7.5)
    end
  end

  describe 'average_array' do
    it 'accepts an array of numbers as an arg' do
      expect { average_array([2, 4, 6]) }.not_to raise_error
    end

    it 'returns the average of the numbers of the array' do
      expect(average_array([2, 4, 6])).to eq(4)
      expect(average_array([3, -4, 21, 8])).to eq(7)
      expect(average_array([5, 10])).to eq(7.5)
    end
  end

  describe 'repeat' do
    it 'accepts a string and a number as args' do
      expect { repeat('happy', 2) }.not_to raise_error
    end

    it 'returns a new string where the original is repeated that number of times' do
      expect(repeat('happy', 2)).to eq('happyhappy')
      expect(repeat('Work', 5)).to eq('WorkWorkWorkWorkWork')
      expect(repeat('whoa', 0)).to eq('')
    end
  end

  describe 'yell' do
    it 'accepts a string as an arg' do
      expect { yell('hello') }.not_to raise_error
    end

    it 'returns a yelled version of the string' do
      expect(yell('hello')).to eq('HELLO!')
      expect(yell('goodBYE')).to eq('GOODBYE!')
    end
  end

  describe 'alternating_case' do
    it 'accepts a sentence string as an arg' do
      expect { alternating_case('code never lies, comments sometimes do.') }.not_to raise_error
    end

    it 'returns the sentence with words alternating between uppercase and lowercase' do
      expect(alternating_case('code never lies, comments sometimes do.')).to eq('CODE never LIES, comments SOMETIMES do.')
      expect(alternating_case('HEY PROGRAMMERS')).to eq('HEY programmers')
    end
  end
end
