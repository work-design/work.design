class SmartMigration30 < ActiveRecord::Migration[7.2]

  def change



    add_column :qingflow_items, :apply_at, :datetime
    add_column :qingflow_items, :linked_audits, :jsonb
    add_column :qingflow_items, :linked_logs, :string, array: true

    add_column :qingflow_files, :replace, :jsonb

    add_column :factory_products, :min_price, :decimal
    add_column :factory_products, :max_price, :decimal
  end

end
