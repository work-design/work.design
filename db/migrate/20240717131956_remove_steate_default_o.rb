class RemoveSteateDefaultO < ActiveRecord::Migration[7.2]
  def change
    change_column_default :trade_orders, :state, nil
  end
end
