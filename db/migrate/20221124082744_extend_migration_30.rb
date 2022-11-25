class ExtendMigration30 < ActiveRecord::Migration[7.0]

  def change

    create_table :ship_ways do |t|
      t.belongs_to :organ
      t.belongs_to :user
      t.belongs_to :line
      t.string :name
      t.string :start_name
      t.string :finish_name
      t.integer :locations_count
      t.timestamps
    end

    add_belongs_to :ship_locations, :way
    add_belongs_to :ship_locations, :station
    add_column :ship_locations, :area_ancestors, :jsonb
    remove_column :ship_locations, :line_id, :integer, scale: 8

    add_column :wechat_suite_tickets, :corpid, :string
    add_column :wechat_suite_tickets, :to, :string
    remove_column :wechat_suite_tickets, :suite_id, :integer, scale: 8

    add_belongs_to :wechat_receivers, :app_payee
    remove_column :wechat_receivers, :payee_id, :integer, scale: 8

    create_table :wechat_partners do |t|
      t.string :name
      t.string :appid, comment: "sp_appid"
      t.string :mch_id, comment: "支付专用、商户号"
      t.text :key
      t.text :key_v3
      t.string :serial_no
      t.text :apiclient_cert
      t.text :apiclient_key
      t.datetime :platform_effective_at
      t.datetime :platform_expire_at
      t.string :platform_serial_no
      t.jsonb :encrypt_certificate
      t.timestamps
    end

    remove_column :wechat_corp_users, :organ_id, :integer, scale: 8

    add_column :wechat_corps, :agent_ticket, :string
    add_column :wechat_corps, :agent_ticket_expires_at, :datetime
    add_column :wechat_corps, :debug, :boolean
    remove_column :wechat_corps, :provider_id, :integer, scale: 8

    create_table :wechat_app_payees do |t|
      t.belongs_to :payee
      t.string :appid, index: true
      t.string :domain
      t.timestamps
    end

    add_belongs_to :wechat_payees, :partner
    add_column :wechat_payees, :type, :string
    add_column :wechat_payees, :name, :string
    remove_column :wechat_payees, :appid, :string
    remove_column :wechat_payees, :domain, :string

    add_column :wechat_apps, :app_payees_count, :integer
    add_column :wechat_apps, :debug, :boolean
    remove_column :wechat_apps, :payees_count, :integer, scale: 4

    add_belongs_to :factory_provides, :product_taxon

    add_belongs_to :factory_products, :factory_taxon
    add_belongs_to :factory_products, :upstream
    remove_column :factory_products, :part_providers_count, :integer, scale: 4, default: "0"

    add_belongs_to :factory_productions, :product_host
    add_belongs_to :factory_productions, :factory_taxon
    add_belongs_to :factory_productions, :provider
    add_belongs_to :factory_productions, :upstream
    add_column :factory_productions, :type, :string

    add_belongs_to :trade_payments, :app_payee
    remove_column :trade_payments, :payee_id, :integer, scale: 8

    remove_column :trade_orders, :agent_id, :integer, scale: 8

    remove_column :trade_items, :agent_id, :integer, scale: 8

    add_column :org_organs, :corpid, :string
  end

end
