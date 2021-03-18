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
      expect(dessert.ingredients).to be_a(Array)
      expect(dessert.ingredients.length).to eq(0)
    end

    it 'raises an argument error when given a non-integer quantity'
      # dessert.
  end

  describe '#add_ingredient' do
    it 'adds an ingredient to the ingredients array' do
      dessert.add_ingredient('Ice')
      expect(dessert.ingredients[0]).to eq('Ice')
      dessert.add_ingredient('Cream')
      expect(dessert.ingredients[1]).to eq('Cream')
    end
  end

  describe '#mix!' do
    it 'shuffles the ingredient array'
  end

  describe '#eat' do
    it 'subtracts an amount from the quantity'

    it 'raises an error if the amount is greater than the quantity'
  end

  describe '#serve' do
    it "contains the titleized version of the chef's name"
  end

  describe '#make_more' do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
