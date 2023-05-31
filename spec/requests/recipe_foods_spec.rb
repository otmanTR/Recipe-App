require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'User Name', role: 'admin', email: 'jermy123456@gmail.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(name: 'Recipe Name', description: 'Recipe Description', public: true,
                            preparation_time: '10', cooking_time: '10', user_id: @user.id)
    @food = Food.create(name: 'Food Name', user_id: @user.id, measurement_unit: 'KG', price: 10, quantity: 10)
    @recipe_food = RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: '1')

    get new_recipe_recipe_food_path(@recipe)
  end

  describe 'GET /new' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'response is rendered with the correct template' do
      expect(response).to render_template('new')
    end

    it 'response contains the correct content' do
      expect(response.body).to include('Create new Recipe Food')
    end
  end
end
