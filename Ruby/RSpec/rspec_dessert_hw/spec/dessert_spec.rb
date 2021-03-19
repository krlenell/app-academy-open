require 'rspec'
require 'dessert'

# Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.

describe Dessert do
  let(:chef) { double('chef') }
  # subject(:dessert { Dessert.new(chef)}
  let(:dessert) { described_class.new('Ice Cream', 4, chef) }

  describe '#initialize' do

    it 'sets a type' do
      expect(dessert.type).to eq('Ice Cream')
    end

    it 'sets a quantity' do
      expect(dessert.quantity).to eq(4)
    end

    it 'starts ingredients as an empty array' do
      expect(dessert.ingredients).to be_empty
    end

    it 'raises an argument error when given a non-integer quantity' do
      expect { described_class.new('Ice', 'a', chef) }.to raise_error(ArgumentError)
    end
  end

  describe '#add_ingredient' do
    it 'adds an ingredient to the ingredients array' do
      dessert.add_ingredient('Ice')
      dessert.add_ingredient('Cream')
      expect(dessert.ingredients[0]).to eq('Ice')
      expect(dessert.ingredients[1]).to eq('Cream')
    end
  end

  describe '#mix!' do

    it 'shuffles the ingredient array' do
      ingredients = %w[eggs milk chocolate bananas]
      ingredients.each {dessert.add_ingredient(_1)}

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
    end
  end

  describe '#eat' do
    it 'subtracts an amount from the quantity' do
      expect(dessert.quantity).to eq(4)
      dessert.eat(1)
      expect(dessert.quantity).to eq(3)
    end

    it 'raises an error if the amount is greater than the quantity' do
      expect {dessert.eat(100)}.to raise_error('not enough left!')
    end

  end

  describe '#serve' do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef jeff the Great Baker')
      expect(dessert.serve).to eq('Chef jeff the Great Baker has made 4 Ice Creams!')
    end
  end

  describe '#make_more' do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end

  end
end
