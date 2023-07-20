class ExtendMigration46 < ActiveRecord::Migration[7.0]

  def change


    remove_column :trade_payment_references, :client_id, :integer, scale: 8

    remove_column :trade_deliveries, :client_id, :integer, scale: 8

    add_belongs_to :trade_items, :maintain

    add_column :crm_maintains, :items_count, :integer
    add_column :crm_maintains, :carts_count, :integer
  end

end
