require 'part_1'

describe 'PART 1' do
  describe 'select_even_nums' do
    it 'accepts an array of numbers as an arg' do
      select_even_nums([7, 3, 2, 5, 12])
    end

    it 'returns an array containing only the even numbers' do
      expect(select_even_nums([7, 3, 2, 5, 12])).to eq([2, 12])
      expect(select_even_nums([20, 40, 31])).to eq([20, 40])
      expect(select_even_nums([1, 2017])).to eq([])
    end

    it 'uses Array#select' do
      array = [7, 3, 2, 5, 12]
      expect(array).to receive(:select).at_least(:once)
      select_even_nums(array)
    end
  end

  describe 'reject_puppies' do
    it 'accepts an array of dog hashes as an arg' do
      dogs = [
        { 'name' => 'Fido', 'age' => 3 },
        { 'name' => 'Spot', 'age' => 2 },
        { 'name' => 'Rex', 'age' => 5 },
        { 'name' => 'Gizmo', 'age' => 1 }
      ]

      expect { reject_puppies(dogs) }.not_to raise_error
    end

    it 'returns an array containing the dogs that are older than 2 years' do
      dogs = [
        { 'name' => 'Fido', 'age' => 3 },
        { 'name' => 'Spot', 'age' => 2 },
        { 'name' => 'Rex', 'age' => 5 },
        { 'name' => 'Gizmo', 'age' => 1 }
      ]

      expect(reject_puppies(dogs)).to eq([{ 'name' => 'Fido', 'age' => 3 }, { 'name' => 'Rex', 'age' => 5 }])
    end

    it 'uses Array#reject' do
      dogs = [
        { 'name' => 'Fido', 'age' => 3 },
        { 'name' => 'Spot', 'age' => 2 },
        { 'name' => 'Rex', 'age' => 5 },
        { 'name' => 'Gizmo', 'age' => 1 }
      ]

      expect(dogs).to receive(:reject).at_least(:once)
      reject_puppies(dogs)
    end
  end

  describe 'count_positive_subarrays' do
    it 'accepts a 2D array as an arg' do
      array = [
        [-2, 5],
        [1, -9, 1],
        [4, 7]
      ]

      expect { count_positive_subarrays(array) }.not_to raise_error
    end

    it 'returns the number of subarrays whose elements sum to a positive quantity' do
      array_1 = [
        [-2, 5],
        [1, -9, 1],
        [4, 7]
      ]
      expect(count_positive_subarrays(array_1)).to eq(2)

      array_2 = [
        [4],
        [-20, 1, 3],
        [4, -5],
        [-1000, 1000, -1, 1]
      ]
      expect(count_positive_subarrays(array_2)).to eq(1)
    end

    it 'uses Array#count' do
      array = [
        [-2, 5],
        [1, -9, 1],
        [4, 7]
      ]

      expect(array).to receive(:count).at_least(:once)
      count_positive_subarrays(array)
    end
  end

  describe 'aba_translate' do
    it 'accepts a word string as an arg' do
      expect { aba_translate('cats') }.not_to raise_error
    end

    it "transforms the word by putting a 'b' after every vowel and adding that same vowel" do
      expect(aba_translate('cats')).to eq('cabats')
      expect(aba_translate('dog')).to eq('dobog')
      expect(aba_translate('kite')).to eq('kibitebe')
      expect(aba_translate('afrika')).to eq('abafribikaba')
      expect(aba_translate('fly')).to eq('fly')
    end
  end

  describe 'aba_array' do
    it 'accepts an array of words as an arg' do
      expect { aba_array(%w[cat dog butterfly]) }.not_to raise_error
    end

    it "returns a new array where every word has been 'aba translated'" do
      expect(aba_array(%w[cat dog butterfly])).to eq(%w[cabat dobog bubutteberfly])
      expect(aba_array(%w[fly kite])).to eq(%w[fly kibitebe])
    end

    it 'uses Array#map' do
      array = %w[cat dog butterfly]
      expect(array).to receive(:map).at_least(:once)
      aba_array(array)
    end

    it 'uses your previous aba_translate method' do
      expect(self).to receive(:aba_translate).at_least(:once)
      aba_array(%w[cat dog butterfly])
    end
  end
end
