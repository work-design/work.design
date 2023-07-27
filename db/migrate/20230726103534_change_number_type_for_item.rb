class ChangeNumberTypeForItem < ActiveRecord::Migration[7.0]
  def change
    change_column :trade_items, :number, :decimal
    change_column :trade_items, :done_number, :decimal
    change_column :trade_items, :rest_number, :decimal
  end
end
