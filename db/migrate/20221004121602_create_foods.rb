class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurment_unint
      t.integer :quantity
      t.decimal :price
      t.references :user, index: true, forreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
