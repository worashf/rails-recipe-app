class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_food.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_food.new(recipe_food_parametters)

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

  def edit
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_food.find(params[:id])

    if @recipe_food.update(recipe_food_parametters)
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient added!' }
      end
    else
      respond_to do |format|
        format.html { render :edit, alert: 'Please fill all the fields!' }
      end
    end
  end

  private

  def recipe_food_parametters
    params.permit(:recipe_id, :food_id, :quantity)
  end
end
