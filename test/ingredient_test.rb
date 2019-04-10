require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test

  def setup
    @bananas = Ingredient.new("bananas", "1 lb.", 260)
  end

  def test_it_exists
    assert_instance_of Ingredient, @bananas
  end

  def test_it_has_attributes
    assert_equal "bananas", @bananas.name
    assert_equal "1 lb.", @bananas.unit
    assert_equal 260, @bananas.calories
  end
end
