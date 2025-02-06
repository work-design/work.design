class SmartMigration75 < ActiveRecord::Migration[8.0]

  def change

    add_column :com_acme_orders, :sync_host, :string
    add_column :com_acme_orders, :sync_path, :string

  end

end
