require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  before(:each) do
    @user = User.create(name: 'User Name', email: 'jermy123456@gmail.com', password: '123456')
    @recipe = Recipe.create(name: 'Recipe Name', description: 'Recipe Description', public: true,
                            preparation_time: '10', cooking_time: '10', user_id: @user.id)
    @food = Food.create(name: 'Food Name', user_id: @user.id, measurement_unit: 'KG', price: 10, quantity: 10)

    @shopping_list = create_shopping_list(@recipe)

    get recipe_shopping_lists_path(@recipe)
  end

  describe 'GET /index' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'response is rendered with the correct template' do
      expect(response).to render_template('index')
    end

    it 'response contains the correct content' do
      expect(response.body).to include('Shopping List')
    end
  end

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
end
