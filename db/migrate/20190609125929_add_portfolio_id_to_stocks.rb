class AddPortfolioIdToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :portfolio_id, :integer
  end
end
