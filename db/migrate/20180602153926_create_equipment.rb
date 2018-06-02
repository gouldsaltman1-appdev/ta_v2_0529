class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :owner_id
      t.integer :category_id

      t.timestamps

    end
  end
end
