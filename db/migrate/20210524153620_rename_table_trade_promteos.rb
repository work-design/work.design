class RenameTableTradePromteos < ActiveRecord::Migration[6.1]
  def change
    rename_table :promotes, :trade_promotes
  end
end
