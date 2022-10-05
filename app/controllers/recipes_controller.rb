class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_parametters)
    @user = User.first
    recipe.user = @user

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
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
