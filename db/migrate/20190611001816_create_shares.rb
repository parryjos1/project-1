class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.text :name
      t.text :ticker
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
