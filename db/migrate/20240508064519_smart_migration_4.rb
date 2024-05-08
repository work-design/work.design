class SmartMigration4 < ActiveRecord::Migration[7.1]

  def change

    add_column :ship_box_hosts, :step, :decimal, comment: "Item Number Step"

    add_column :bench_facilitates, :step, :decimal, comment: "Item Number Step"

    add_column :growth_aim_users, :text_year, :string
    add_column :growth_aim_users, :text_month, :string
    add_column :growth_aim_users, :text_week, :string
    add_column :growth_aim_users, :text_date, :string
    remove_column :growth_aim_users, :serial_number, :string

    add_column :growth_aim_entities, :text_year, :string
    add_column :growth_aim_entities, :text_month, :string
    add_column :growth_aim_entities, :text_week, :string
    add_column :growth_aim_entities, :text_date, :string
    remove_column :growth_aim_entities, :serial_number, :string

    add_column :wechat_apps, :platform_appid, :string
    add_column :wechat_apps, :oauth_domain, :string

    add_column :finance_funds, :step, :decimal, comment: "Item Number Step"

    add_column :markdown_posts, :shared, :boolean

    add_column :factory_provides, :name, :string

    add_column :factory_productions, :step, :decimal, comment: "Item Number Step"

    add_column :trade_purchases, :step, :decimal, comment: "Item Number Step"

    remove_column :trade_promotes, :verified, :boolean, default: "false"

    add_column :trade_item_promotes, :original_amount, :decimal
    add_column :trade_item_promotes, :unit_price, :decimal

    add_column :trade_cart_promotes, :unit_prices, :jsonb

    add_column :trade_advances, :step, :decimal, comment: "Item Number Step"

    add_belongs_to :trade_promote_goods, :card_template

    add_belongs_to :trade_orders, :provide

    add_belongs_to :trade_items, :source
    add_belongs_to :trade_items, :unit
    add_column :trade_items, :purchase_items_count, :integer
    remove_column :trade_items, :original_amount, :decimal, precision: 10, scale: 2
    remove_column :trade_items, :retail_price, :decimal, precision: 10, scale: 2
    remove_column :trade_items, :wholesale_price, :decimal, precision: 10, scale: 2

    create_table :profiled_avatars do |t|
      t.string :name
      t.timestamps
    end

    add_column :org_organs, :factory_settings, :jsonb

    add_column :crm_sources, :step, :decimal, comment: "Item Number Step"

    remove_column :crm_clients, :vendor, :boolean

    add_column :crm_contacts, :wechat_openid, :string

    add_column :auth_apps, :host, :string

    add_column :auth_authorized_tokens, :auth_appid, :string
  end

end
