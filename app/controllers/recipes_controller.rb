class RecipesController < ApplicationController
    
    def index;
    @user = current_user
    @recipes = @user.recipes
    end
  

    def show
        @recipe = Recipe.find(params[:id])
        @user = User.find(params[:user_id])
      end

    private

    def recipe_params
      params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public)
    end
  end
  