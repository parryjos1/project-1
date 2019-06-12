class AddFundsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :funds, :integer
  end
end
