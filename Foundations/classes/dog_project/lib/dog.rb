class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  attr_accessor :age
  attr_reader :name, :breed, :favorite_foods

  def bark
    return @bark.upcase if @age > 3

    @bark.downcase if @age <= 3
  end

  def favorite_food?(query)
    @favorite_foods.any? do |food|
      food.downcase == query.downcase
    end
  end
end
