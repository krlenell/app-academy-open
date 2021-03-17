require 'problems'

describe 'largest_prime_factor' do
  it 'accepts a number as an arg' do
    expect { largest_prime_factor(15) }.not_to raise_error
  end

  it 'returns the largest divisor of the number that is also a prime number' do
    expect(largest_prime_factor(15)).to eq(5)
    expect(largest_prime_factor(7)).to eq(7)
    expect(largest_prime_factor(24)).to eq(3)
    expect(largest_prime_factor(2)).to eq(2)
  end
end

describe 'unique_chars?' do
  it 'accepts a string as an arg' do
    expect { unique_chars?('computer') }.not_to raise_error
  end

  context 'when there are no duplicate characters in the string' do
    it 'returns true' do
      expect(unique_chars?('computer')).to eq(true)
      expect(unique_chars?('dog')).to eq(true)
    end
  end

  context 'when there are duplicate characters in the string' do
    it 'returns false' do
      expect(unique_chars?('bicycle')).to eq(false)
      expect(unique_chars?('program')).to eq(false)
      expect(unique_chars?('mississppi')).to eq(false)
    end
  end
end

describe 'dupe_indices' do
  it 'accepts an array as an arg' do
    expect { dupe_indices(%w[a b c c b]) }.not_to raise_error
  end

  it 'returns an hash where keys are the elements that were repeated in the array and values are the indices where that element appears' do
    expect(dupe_indices(%w[a b c c b])).to eq({ 'b' => [1, 4], 'c' => [2, 3] })
    expect(dupe_indices(%w[a a c c b c])).to eq({ 'a' => [0, 1], 'c' => [2, 3, 5] })
    expect(dupe_indices(%w[a b c])).to eq({})
  end
end

describe 'ana_array' do
  it 'accepts two arrays as args' do
    expect { ana_array(%w[i c e m a n], %w[c i n e m a]) }.not_to raise_error
  end

  context 'when the arrays contain the same elements, in any order' do
    it 'returns true' do
      expect(ana_array(%w[i c e m a n], %w[c i n e m a])).to eq(true)
      expect(ana_array(%w[cat dog cat], %w[dog cat cat])).to eq(true)
    end
  end

  context 'when the arrays do not contain the same elements' do
    it 'returns false' do
      expect(ana_array(%w[cat dog cat], %w[dog cat mouse])).to eq(false)
      expect(ana_array(['cat'], %w[cat dog])).to eq(false)
      expect(ana_array(%w[cat dog], ['cat'])).to eq(false)
    end
  end

  it 'does not use Array#sort' do
    arr_1 = %w[i c e m a n]
    arr_2 = %w[c i n e m a]

    expect(arr_1).not_to receive(:sort)
    expect(arr_2).not_to receive(:sort)
    ana_array(arr_1, arr_2)
  end
end
