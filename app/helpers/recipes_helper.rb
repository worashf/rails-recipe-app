module RecipesHelper
  def public_recipes_stats
    recip_stats = []
    public_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)

    public_recipes.each do |recipe|
      recipe_food = recipe.recipe_food
      count_price = 0
      count_items = 0
      recipe_food.each do |rec_food|
        count_price += rec_food.food.price * rec_food.quantity
        count_items += rec_food.quantity
      end
      rec = { rec_id: recipe.id, price: count_price, items: count_items }
      recip_stats.push(rec)
    end
    recip_stats
  end
end
