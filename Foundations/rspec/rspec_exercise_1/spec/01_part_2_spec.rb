require 'part_2'

describe 'Part 2:' do
  describe 'hipsterfy' do
    it 'accepts a word as an arg' do
      expect { hipsterfy('tonic') }.not_to raise_error
    end

    it "returns the word with it's last vowel (a, e, i, o, u) removed" do
      expect(hipsterfy('tonic')).to eq('tonc')
      expect(hipsterfy('panther')).to eq('panthr')
      expect(hipsterfy('swimming')).to eq('swimmng')
    end

    it 'returns the original word if it contains no vowels' do
      expect(hipsterfy('rhythm')).to eq('rhythm')
      expect(hipsterfy('my')).to eq('my')
    end
  end

  describe 'vowel_counts' do
    it 'accepts string as an arg' do
      expect { vowel_counts('code bootcamp') }.not_to raise_error
    end

    it "returns a hash where each key is a vowel of string and it's value is the number of times it appears" do
      expect(vowel_counts('code bootcamp')).to include({ 'o' => 3, 'e' => 1, 'a' => 1 })
      expect(vowel_counts('williamsburg bridge')).to include({ 'i' => 3, 'a' => 1, 'u' => 1, 'e' => 1 })
      expect(vowel_counts('WILLIAMSBURG bridge')).to include({ 'i' => 3, 'a' => 1, 'u' => 1, 'e' => 1 })
    end
  end

  describe 'caesar_cipher' do
    it 'accepts a message and a number (n) as an arg' do
      expect { caesar_cipher('hello', 5) }.not_to raise_error
    end

    it 'returns a new string where every letter of the message is shifted n positions in the alphabet' do
      expect(caesar_cipher('apple', 1)).to eq('bqqmf')
      expect(caesar_cipher('apple', 2)).to eq('crrng')
      expect(caesar_cipher('hello', 5)).to eq('mjqqt')
      expect(caesar_cipher('zebra', 4)).to eq('difve')
      expect(caesar_cipher('whoa', 26)).to eq('whoa')
      expect(caesar_cipher('whoa', 52)).to eq('whoa')
    end

    it 'does not modify non-alphabetic characters' do
      expect(caesar_cipher('123 _-!?@%', 3)).to eq('123 _-!?@%')
      expect(caesar_cipher('hello world!', 1)).to eq('ifmmp xpsme!')
      expect(caesar_cipher('welcome to week 3, day 1', 2)).to eq('ygneqog vq yggm 3, fca 1')
    end
  end
end
