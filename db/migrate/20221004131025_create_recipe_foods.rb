class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipe, index: true, forreign_key: {to_table: :recipes}
      t.references :food, index: true, forreign_key: {to_table: :foods}

      t.timestamps
    end
  end
end
