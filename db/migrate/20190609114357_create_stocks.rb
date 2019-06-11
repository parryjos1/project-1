class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.text :name
      t.text :ticker
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
