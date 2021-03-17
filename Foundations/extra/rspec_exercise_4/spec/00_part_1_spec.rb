require 'part_1'

describe 'PART 1' do
  describe 'my_reject' do
    it 'accepts an array and a block as args' do
      expect { my_reject([7, 6, 5, 4]) { |n| n.even? } }.not_to raise_error
    end

    it 'returns a new array containing elements from the original array that resulted in false when passed into the block' do
      expect(my_reject([7, 6, 5, 4]) { |n| n.even? }).to eq([7, 5])
      expect(my_reject([-3, 5, 0, 8]) { |n| n > 0 }).to eq([-3, 0])
    end

    it 'does not use the built-in Array#reject' do
      array = [7, 6, 5, 4]
      expect(array).not_to receive(:reject)
      my_reject(array) { |n| n.even? }
    end
  end

  describe 'my_one?' do
    it 'accepts an array and a block as args' do
      expect { my_one?([5, 10, 7, 3]) { |n| n.even? } }.not_to raise_error
    end

    context 'when exactly one element of the array results in true when passed into the block' do
      it 'returns true' do
        expect(my_one?([5, 10, 7, 3]) { |n| n.even? }).to eq(true)
        expect(my_one?(%w[a b c x]) { |char| char == 'x' }).to eq(true)
      end
    end

    context 'when there is not exactly one element that results in true when passed into the block' do
      it 'returns false' do
        expect(my_one?([8, 10, 7, 3]) { |n| n.even? }).to eq(false)
        expect(my_one?(%w[a x c x]) { |char| char == 'x' }).to eq(false)
        expect(my_one?(%w[a b c d]) { |char| char == 'x' }).to eq(false)
      end
    end

    it 'does not use the built-in Array#one?' do
      array = [5, 10, 7, 3]
      expect(array).not_to receive(:one?)
      my_one?(array) { |n| n.even? }
    end
  end

  describe 'hash_select' do
    it 'accepts a hash and a block as args' do
      expect do
        hash_select({ 'a' => 0, 'b' => 1, 'c' => 2, 'o' => 14 }) do |k, _v|
          'aeiou'.include?(k)
        end
      end.not_to raise_error
    end

    it 'returns a new hash containing only the key=>value pairs that resulted in true when passed into the block' do
      expect(hash_select({ 'a' => 0, 'b' => 1, 'c' => 2, 'o' => 14 }) do |k, _v|
               'aeiou'.include?(k)
             end).to eq({ 'a' => 0, 'o' => 14 })
      expect(hash_select({ 'a' => 0, 'b' => 1, 'c' => 2, 'o' => 14 }) do |_k, v|
               v.even?
             end).to eq({ 'a' => 0, 'c' => 2, 'o' => 14 })
    end

    it 'does not use the built-in Hash#select' do
      hash = { 'a' => 0, 'b' => 1, 'c' => 2, 'o' => 14 }
      expect(hash).not_to receive(:select)
      hash_select(hash) { |k, _v| 'aeiou'.include?(k) }
    end
  end

  describe 'xor_select' do
    it 'accepts an array and two procs as args' do
      even = proc { |n| n.even? }
      positive = proc { |n| n > 0 }

      expect { xor_select([2, 5, 3, 7, 6, -8, -1], even, positive) }.not_to raise_error
    end

    it 'does not select elements that result in true for both procs' do
      even = proc { |n| n.even? }
      positive = proc { |n| n > 0 }

      expect(xor_select([2, 4, 6, 8], even, positive)).to match_array([])
    end

    it 'returns a new array of elements that result in true when exactly one of the procs results in true when given that element' do
      even = proc { |n| n.even? }
      positive = proc { |n| n > 0 }

      expect(xor_select([2, 5, 3, 7, 6, -8, -1], even, positive)).to match_array([5, 3, 7, -8])
    end
  end

  describe 'proc_count' do
    it 'accepts a value and an array containing proc objects as args' do
      even = proc { |n| n.even? }
      div_by_5 = proc { |n| n % 5 == 0 }
      positive = proc { |n| n % 5 == 0 }

      expect { proc_count(12, [even, div_by_5, positive]) }.not_to raise_error
    end

    it 'returns a number representing the count of procs that evaluate to true when called with the given value' do
      even = proc { |n| n.even? }
      div_by_5 = proc { |n| n % 5 == 0 }
      positive = proc { |n| n > 0 }
      expect(proc_count(12, [even, div_by_5, positive])).to eq(2)
      expect(proc_count(-4, [even, div_by_5, positive])).to eq(1)

      upcase = proc { |s| s == s.upcase }
      ends_exclamation = proc { |s| s[-1] == '!' }
      expect(proc_count('RUN!', [upcase, ends_exclamation])).to eq(2)
      expect(proc_count('FOREST', [upcase, ends_exclamation])).to eq(1)
      expect(proc_count('forest', [upcase, ends_exclamation])).to eq(0)
    end
  end
end
