class CreateBitcoins < ActiveRecord::Migration[5.2]
  def change
    create_table :bitcoins do |t|
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
