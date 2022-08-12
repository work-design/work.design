class RenameTradeItemToItem < ActiveRecord::Migration[7.0]
  def change
    rename_table :trade_trade_items, :trade_items

    rename_column :trade_item_promotes, :trade_item_id, :item_id
    rename_column :trade_card_purchases, :trade_item_id, :item_id
    rename_column :trade_cards, :trade_item_id, :item_id
    rename_column :trade_carts, :trade_items_count, :items_count
    rename_column :trade_orders, :trade_items_count, :items_count
    rename_column :trade_rents, :trade_item_id, :item_id
    rename_column :trade_wallet_advances, :trade_item_id, :item_id
  end
end
