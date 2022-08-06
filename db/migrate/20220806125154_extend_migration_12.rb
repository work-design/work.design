class ExtendMigration12 < ActiveRecord::Migration[7.0]

  def change

    create_table :com_debug_manies do |t|
      t.belongs_to :debug
      t.string :name
      t.timestamps
    end

    remove_column :com_debugs, :info_id, :integer, scale: 8

    add_belongs_to :crm_maintains, :client_user
    add_belongs_to :crm_maintains, :client_member

    create_table :ship_shipment_logs do |t|
      t.belongs_to :shipment
      t.belongs_to :station
      t.datetime :expected_leave_at
      t.datetime :left_at
      t.datetime :arrived_at
      t.datetime :prepared_at
      t.timestamps
    end

    add_belongs_to :ship_shipment_items, :station

    add_belongs_to :ship_shipments, :current_line_station
    add_column :ship_shipments, :expected_leave_at, :datetime
    add_column :ship_shipments, :expected_arrive_at, :datetime

    add_column :ship_line_stations, :expected_minutes, :integer, comment: "预计到下站分钟数"

    add_column :wechat_template_key_words, :note, :string

    add_column :wechat_templates, :template_kind, :string
    remove_column :wechat_templates, :template_config_id, :integer, scale: 8

    remove_column :wechat_template_configs, :appid, :string

    remove_column :profiled_addresses, :agent_id, :integer, scale: 8

    add_column :trade_wallet_templates, :digit, :integer
    add_column :trade_wallet_templates, :unit_kind, :string

    add_belongs_to :trade_payment_strategies, :organ
    add_column :trade_payment_strategies, :from_pay, :boolean, default: true

    add_belongs_to :trade_payment_orders, :user
    add_column :trade_payment_orders, :kind, :string

    add_column :trade_payments, :payment_orders_count, :integer, default: 0
    add_column :trade_payments, :payment_id, :integer, comment: "for paypal"

    add_column :trade_trade_items, :organ_ancestor_ids, :jsonb, default: []

    add_belongs_to :trade_orders, :from_user
    add_belongs_to :trade_orders, :from_member
    add_belongs_to :trade_orders, :from_member_organ
    add_column :trade_orders, :pay_deadline_at, :datetime
    add_column :trade_orders, :unreceived_amount, :decimal
    add_column :trade_orders, :generate_mode, :string, default: "myself"
    remove_column :trade_orders, :payment_id, :integer, scale: 4
    remove_column :trade_orders, :collectable, :boolean, default: "false"
    remove_column :trade_orders, :payment_kind, :string
  end

end
