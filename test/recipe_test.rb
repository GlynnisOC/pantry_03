require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @banana_bread = Recipe.new("Banana Bread")
  end

  def test_it_exists
    assert_instance_of Recipe, @banana_bread
  end

  def test_it_has_attributes
    assert_equal "Banana Bread", @banana_bread.name
  end

  def test_recipe_starts_without_ingredients
    assert_equal ({}), @banana_bread.ingredients
  end

  def test_recipe_can_add_ingredients_and_amount_needed
    @bananas = Ingredient.new("bananas", "1 lb", 260)
    @walnuts = Ingredient.new("Walnuts", "1 oz", 50)
    @banana_bread.add_ingredient(@walnuts, 2)
    @banana_bread.add_ingredient(@bananas, 1)
    assert_equal ({@walnuts=> 2, @bananas=> 1}), @banana_bread.ingredients
  end

  def test_it_can_tell_how_much_of_ingredient_you_need_to_make_that_bread
    @bananas = Ingredient.new("bananas", "1 lb", 260)
    @walnuts = Ingredient.new("Walnuts", "1 oz", 50)
    @banana_bread.add_ingredient(@walnuts, 2)
    @banana_bread.add_ingredient(@bananas, 1)
    assert_equal 2, @banana_bread.quantity_needed(@walnuts)
  end

  def test_it_returns_total_calories_in_that_bread
    @bananas = Ingredient.new("bananas", "1 lb", 260)
    @walnuts = Ingredient.new("Walnuts", "1 oz", 50)
    @banana_bread.add_ingredient(@walnuts, 2)
    @banana_bread.add_ingredient(@bananas, 1)
    assert_equal 310, @banana_bread.total_calories
  end
end
