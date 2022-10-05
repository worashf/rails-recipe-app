require 'recipes_helper'

class RecipesController < ApplicationController
  include RecipesHelper

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @food_recipe = @recipe.recipe_food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_parametters)
    @user = current_user
    recipe.user = @user

    if recipe.save
      respond_to do |format|
        format.html { redirect_to recipes_path, notice: 'Recipe created!' }
      end
    else
      respond_to do |format|
        format.html { render :new, alret: 'Please fill all the fields!' }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  def public
    @public_recipes = Recipe.all.where(public: true)
  end

  private

  def recipe_parametters
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
