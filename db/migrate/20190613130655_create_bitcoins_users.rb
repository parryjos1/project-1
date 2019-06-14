class CreateBitcoinsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bitcoins_users do |t|
      t.integer :bitcoin_id
      t.integer :user_id
    end
  end
end
