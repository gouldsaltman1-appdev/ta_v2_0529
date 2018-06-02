class AddPickupdropoffLocationLatitudeToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :pickupdropoff_location_latitude, :float
  end
end
