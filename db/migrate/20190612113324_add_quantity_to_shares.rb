class AddQuantityToShares < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :quantity, :integer
  end
end
