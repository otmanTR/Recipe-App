require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:user) { User.new(name: 'User Name', email: 'dem@gmail.com') }

  let!(:recipe) do
    Recipe.create(name: 'Recipe Name', description: 'Recipe Description', public: true,
                  preparation_time: '10', cooking_time: '10', user_id: user.id)
  end

  before { recipe.save }

  describe 'Validations' do
    it 'is not valid with a name less than 3 characters' do
      recipe.name = 'a' * 2
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a name' do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      recipe.description = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a preparation_time' do
      recipe.preparation_time = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a cooking_time' do
      recipe.cooking_time = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid with a cooking_time less than 0' do
      recipe.cooking_time = -1
      expect(recipe).to_not be_valid
    end

    it 'is not valid with a description more than 1000 characters' do
      recipe.description = 'a' * 1001
      expect(recipe).to_not be_valid
    end

    it 'is not valid with a preparation_time less than 0' do
      recipe.preparation_time = -1
      expect(recipe).to_not be_valid
    end
  end

  describe 'View' do
    it 'should have a public' do
      expect(recipe.public).to eq(true)
    end
    it 'should have a name' do
      expect(recipe.name).to eq('Recipe Name')
    end

    it 'should have a description' do
      expect(recipe.description).to eq('Recipe Description')
    end

    it 'should have a cooking_time' do
      expect(recipe.cooking_time).to eq(10)
    end
    it 'should have a preparation_time' do
      expect(recipe.preparation_time).to eq(10)
    end
  end
end
