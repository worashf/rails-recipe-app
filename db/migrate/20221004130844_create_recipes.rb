class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparationTime
      t.integer :cookingTime
      t.text :description
      t.boolean :public
      t.references :user, index: true, forreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
