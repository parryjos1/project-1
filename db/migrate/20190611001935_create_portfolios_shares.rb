class CreatePortfoliosShares < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios_shares do |t|
      t.integer :portfolio_id
      t.integer :share_id
    end
  end
end
