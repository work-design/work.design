class SmartMigration73 < ActiveRecord::Migration[8.0]

  def change

    add_column :datum_templates, :code, :string
    add_column :datum_templates, :uploaded_at, :datetime

    add_column :datum_exports, :code, :string

    add_column :qingflow_exports, :code, :string
    add_column :qingflow_exports, :filter, :jsonb

    add_column :qingflow_aliases, :full_title, :string

    add_column :qingflow_apps, :client_id, :string
    add_column :qingflow_apps, :client_secret, :string

    add_column :trade_payments, :orders_amount, :decimal, comment: "订单金额汇总"

    add_column :trade_orders, :payable_amount, :decimal
    add_column :trade_orders, :verifying_amount, :decimal, comment: "待核销金额"
  end

end
