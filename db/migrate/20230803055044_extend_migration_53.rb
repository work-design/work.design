class ExtendMigration53 < ActiveRecord::Migration[7.0]

  def change

    add_column :trade_carts, :advance_amount, :decimal
  end

end
