class AddPiecesOfEquipmentCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pieces_of_equipment_count, :integer
  end
end
