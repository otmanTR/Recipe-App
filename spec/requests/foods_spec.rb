require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Mark', email: 'marcos@gmail.com', password: 'abcdef')
      sign_in @user
      @food = Food.create(name: 'Pilau', measurement_unit: 'grams', price: 120, quantity: 800, user_id: @user.id)
    end

    it 'returns http success' do
      get '/foods'
      expect(response).to have_http_status(:success)
    end

    it 'should show food name' do
      get '/foods'
      expect(response.body).to include(@food.name)
    end

    it 'should show measurement_unit' do
      get '/foods'
      expect(response.body).to include(@food.measurement_unit)
    end

    it 'should show food price' do
      get '/foods'
      expect(response.body).to include(@food.price.to_s)
    end

    it 'should show food quantity' do
      get '/foods'
      expect(response.body).to include(@food.quantity.to_s)
    end
  end
end
