class ExtendMigration52 < ActiveRecord::Migration[7.0]

  def change
    add_column :trade_orders, :advance_amount, :decimal
  end

end
