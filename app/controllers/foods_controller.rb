class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    @food.user = current_user

    if @food.save
      flash[:success] = 'Food created successfully.'
      redirect_to "/users/#{current_user.id}/foods"
    else
      flash[:danger] = 'Food could not be created.'
      render :new
    end
  end

  def destroy; end

  private

  def food_params
    params.require(:food).permit(:name, :price, :quantity)
  end
end
