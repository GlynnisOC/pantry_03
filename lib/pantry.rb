class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    @stock.any? do |ingredient, quantity|
      if recipe[ingredients][name] > stock[ingredient]
        true
      end
    end
  end
end
