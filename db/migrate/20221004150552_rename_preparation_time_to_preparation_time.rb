class RenamePreparationTimeToPreparationTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :preparationTime, :preparation_time
  end
end
