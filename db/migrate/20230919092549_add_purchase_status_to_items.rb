class AddPurchaseStatusToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :trade_items, :purchase_status, :string
  end
end
