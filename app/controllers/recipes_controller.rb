class RecipesController < ApplicationController
    
    def index;
    @user = current_user
    @recipes = @user.recipes
    end
  

    def show
        @recipe = Recipe.find(params[:id])
        @user = User.find(params[:user_id])
      end

      def new
        @recipe = Recipe.new
      end

      def create
        @recipe = current_user.recipes.new(recipe_params)
        @recipe.user = current_user
    
        if @recipe.save
    
          redirect_to recipe_path(@recipe.id), notice: 'Recipe created successfully!'
        else
          notice: 'Recipe could not be created.'
          render :new
        end
      end

    private

    def recipe_params
      params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public)
    end
  end
  