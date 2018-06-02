class AddPiecesOfEquipmentCountToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :pieces_of_equipment_count, :integer
  end
end
