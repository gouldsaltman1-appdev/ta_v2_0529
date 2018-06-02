class AddPickupdropoffLocationLongitudeToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :pickupdropoff_location_longitude, :float
  end
end
