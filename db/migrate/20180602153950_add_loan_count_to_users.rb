class AddLoanCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :loans_count, :integer
  end
end
