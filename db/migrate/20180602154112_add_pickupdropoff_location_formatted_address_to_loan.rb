class AddPickupdropoffLocationFormattedAddressToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :pickupdropoff_location_formatted_address, :string
  end
end
