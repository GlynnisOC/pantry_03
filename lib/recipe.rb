class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(name, quantity)
    @ingredients[name] = quantity
  end

  def quantity_needed(name)
    @ingredients[name]
  end

  def total_calories
    @ingredients.sum do |ingredient, quantity|
      ingredient.calories
    end
  end
end
