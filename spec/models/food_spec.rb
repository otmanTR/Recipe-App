require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Mark', email: 'marcos@gmail.com')
      @food = Food.create(name: 'Pilau', measurement_unit: 'grams', price: 120, quantity: 800, user_id: @user.id)
    end

    it 'has a name' do
      expect(@food.name).to eq('Pilau')
    end

    it 'has a measurement unit' do
      expect(@food.measurement_unit).to eq('grams')
    end

    it 'has a price' do
      expect(@food.price).to eq(120)
    end

    it 'has quantity' do
      expect(@food.quantity).to eq(800)
    end

    it 'belongs to a user' do
      expect(@food.user_id).to eq(@user.id)
    end
  end
end
