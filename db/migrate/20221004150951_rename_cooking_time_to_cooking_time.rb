class RenameCookingTimeToCookingTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :cookingTime, :cooking_time
  end
end
