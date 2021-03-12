class AddOrganToFundsAndStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :stocks, :organ
    add_reference :funds, :organ
  end
end
