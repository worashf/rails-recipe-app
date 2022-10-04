class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @current_user = User.first
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_parametters)

    if recipe.save
      flash[:success] = 'Recipe created successfully!'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Please fill all the fields!'
      render :new
    end
  end

  private

  def recipe_parametters
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end