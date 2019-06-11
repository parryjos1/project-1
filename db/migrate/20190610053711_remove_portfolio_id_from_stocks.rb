class RemovePortfolioIdFromStocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :portfolio_id, :integer
  end
end
