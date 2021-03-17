require 'part_1'

describe 'Part 1:' do
  describe 'partition' do
    it 'accepts an array and a number as args' do
      expect { partition([11, 5, 13, 2, 3], 7) }.not_to raise_error
    end

    it 'returns a 2D array of length 2 where the first subarray contains elements less than the number arg and the second subarray contains elements greater than or equal to the number arg' do
      expect(partition([11, 5, 13, 2, 3], 7)).to eq([[5, 2, 3], [11, 13]])
      expect(partition([1, 2, 4, 3, 5, 7], 5)).to eq([[1, 2, 4, 3], [5, 7]])
      expect(partition([1, 2, 4, 3], 0)).to eq([[], [1, 2, 4, 3]])
    end

    it 'does not use the built-in Array#partition' do
      arr = [11, 5, 13, 2, 3]
      expect(arr).not_to receive(:partition)
      partition(arr, 7)
    end
  end

  describe 'merge' do
    it 'accepts two hashes as args' do
      hash_1 = { 'a' => 10, 'b' => 20 }
      hash_2 = { 'c' => 30, 'd' => 40, 'e' => 50 }
      expect { merge(hash_1, hash_2) }.not_to raise_error
    end

    it 'returns a new hash representing containing key-value from both hashes' do
      hash_1 = { 'a' => 10, 'b' => 20 }
      hash_2 = { 'c' => 30, 'd' => 40, 'e' => 50 }
      expect(merge(hash_1, hash_2)).to eq({ 'a' => 10, 'b' => 20, 'c' => 30, 'd' => 40, 'e' => 50 })
    end

    it 'takes the value from the second hash if the two hashes have duplicate keys' do
      hash_1 = { 'a' => 10, 'b' => 20 }
      hash_2 = { 'c' => 30, 'b' => 7 }
      expect(merge(hash_1, hash_2)).to eq({ 'a' => 10, 'b' => 7, 'c' => 30 })
    end

    it 'does not mutate the two input hashes' do
      hash_1 = { 'a' => 10, 'b' => 20 }
      hash_2 = { 'c' => 30, 'd' => 40, 'e' => 50 }
      merge(hash_1, hash_2)

      expect(hash_1).to eq({ 'a' => 10, 'b' => 20 })
      expect(hash_2).to eq({ 'c' => 30, 'd' => 40, 'e' => 50 })
    end
  end

  describe 'censor' do
    it 'accepts a sentence and an array of curse words as args' do
      expect { censor('Gosh darn it', %w[gosh darn shoot]) }.not_to raise_error
    end

    it "returns the sentence where every curse word has it's vowels replaced with '*'" do
      expect(censor('Gosh darn it', %w[gosh darn shoot])).to eq('G*sh d*rn it')
      expect(censor('SHUT THE FRONT DOOR', ['door'])).to eq('SHUT THE FRONT D**R')
    end
  end

  describe 'power_of_two?' do
    it 'accepts a number as an arg' do
      expect { power_of_two?(16) }.not_to raise_error
    end

    context 'when the number is a power of two' do
      it 'returns true' do
        expect(power_of_two?(16)).to eq(true)
        expect(power_of_two?(32)).to eq(true)
        expect(power_of_two?(64)).to eq(true)
        expect(power_of_two?(1)).to eq(true)
      end
    end

    context 'when the number is not a power of two' do
      it 'returns false' do
        expect(power_of_two?(6)).to eq(false)
        expect(power_of_two?(7)).to eq(false)
        expect(power_of_two?(28)).to eq(false)
        expect(power_of_two?(100)).to eq(false)
      end
    end
  end
end
