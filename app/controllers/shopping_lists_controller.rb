class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_list = create_shopping_list(@recipe)
    @missing_foods = find_missing_foods(@shopping_list)
  end

  private

  def create_shopping_list(recipe)
    shopping_list = {}

    recipe.recipe_foods.each do |recipe_food|
      food = recipe_food.food
      quantity = recipe_food.quantity

      if shopping_list[food.name]
        shopping_list[food.name] += " #{quantity}"
      else
        shopping_list[food.name] = quantity
      end
    end

    shopping_list
  end

  def find_missing_foods(shopping_list)
    all_foods = Food.pluck(:name)
    shopping_foods = shopping_list.keys
    all_foods - shopping_foods
  end
end
