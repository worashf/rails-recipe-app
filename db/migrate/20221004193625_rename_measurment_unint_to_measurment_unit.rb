class RenameMeasurmentUnintToMeasurmentUnit < ActiveRecord::Migration[7.0]
  def change
    rename_column :foods, :measurment_unint, :measurment_unit
  end
end
