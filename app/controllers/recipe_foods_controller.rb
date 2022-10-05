class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_food.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe_food = @recipe.recipe_food.new(recipe_food_parametters)

    if @recipe_food.save
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient added!' }
      end
    else
      respond_to do |format|
        format.html { render :new, alert: 'Please fill all the fields!' }
      end
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = recipe.recipe_food.find(params[:id])
    recipe_food.destroy

    redirect_to recipe_path(recipe)
  end

  private

  def recipe_food_parametters
    params.permit(:recipe_id, :food_id, :quantity)
  end
end
