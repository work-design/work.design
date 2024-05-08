class AddDispatchToTradeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :trade_items, :dispatch, :string
  end
end
