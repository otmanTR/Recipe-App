class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
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
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def public_recipe
    @recipes = Recipe.where(public: true)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public)
  end
end
