class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_food.new
    @foods = Food.where(user_id: current_user.id)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where(user_id: current_user.id)
    @food = Food.find(recipe_food_parametters['food'])
    @recipe_food = @recipe.recipe_food.new(quantity: recipe_food_parametters['quantity'].to_i, food: @food,
                                           recipe: @recipe)

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

  def shopping_list
    recipe = cookies[:recipe_id]
    @recipe_foods = RecipeFood.where(recipe_id: recipe)
    @total_value = 0
    @items_count = @recipe_foods.count

    @recipe_foods.each do |recipie_food|
      @total_value += recipie_food.quantity * recipie_food.food.price
    end
  end

  private

  def recipe_food_parametters
    params.require(:recipe_food).permit(:food, :quantity)
  end
end
