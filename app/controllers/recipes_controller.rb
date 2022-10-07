require 'recipes_helper'

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  include RecipesHelper

  def index
    @recipes = Recipe.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes(:recipe).where(recipe_id: params[:id])
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
    @recipe_prices = public_recipes_stats
    @public_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_parametters
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
