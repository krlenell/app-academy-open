require 'prime'

describe 'prime?' do
  it 'accepts a number as an argument' do
    expect { prime?(7) }.not_to raise_error
  end

  context 'when the number is prime' do
    it 'returns true' do
      expect(prime?(7)).to eq(true)
      expect(prime?(11)).to eq(true)
      expect(prime?(13)).to eq(true)
    end
  end

  context 'when the number is not prime' do
    it 'returns false' do
      expect(prime?(4)).to eq(false)
      expect(prime?(9)).to eq(false)
      expect(prime?(20)).to eq(false)
      expect(prime?(1)).to eq(false)
    end
  end
end
