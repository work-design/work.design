class ExtendMigration34 < ActiveRecord::Migration[7.0]

  def change

    create_table :com_states, id: :uuid do |t|
      t.belongs_to :user
      t.belongs_to :organ
      t.string :host
      t.string :path
      t.string :controller_path
      t.string :action_name
      t.string :request_method
      t.string :referer
      t.jsonb :params
      t.jsonb :body
      t.jsonb :cookie
      t.jsonb :session
      t.boolean :destroyable
      t.timestamps
    end

    add_column :roled_roles, :tip, :string

    add_belongs_to :factory_production_parts, :product
    add_belongs_to :factory_production_parts, :part_taxon

    add_column :factory_product_taxons, :provides_count, :integer

    add_belongs_to :factory_factory_taxons, :scene
    add_column :factory_factory_taxons, :factory_providers_count, :integer

    add_column :wechat_tags, :kind, :string

    create_table :wechat_provider_organs do |t|
      t.belongs_to :provider
      t.string :corpid
      t.string :open_corpid
      t.timestamps
    end

    add_belongs_to :wechat_corp_users, :organ
    add_column :wechat_corp_users, :mobile, :string
    remove_column :wechat_corp_users, :temp_identity, :string

    add_belongs_to :wechat_corps, :organ
    add_column :wechat_corps, :open_corpid, :string, index: true
    remove_column :wechat_corps, :host, :string

    add_column :wechat_app_payees, :mch_id, :string, index: true
    add_column :wechat_app_payees, :enabled, :boolean
    remove_column :wechat_app_payees, :payee_id, :integer, scale: 8

    add_column :trade_card_purchases, :last_expire_at, :datetime
    remove_column :trade_card_purchases, :last_expire_on, :date

    add_column :trade_payments, :refunds_count, :integer
    add_column :trade_payments, :appid, :string
    remove_column :trade_payments, :app_payee_id, :integer, scale: 8

    add_column :trade_orders, :adjust_amount, :decimal

    add_column :org_organs, :service_url, :string, comment: "客服 url"
    remove_column :org_organs, :corpid, :string
  end

end
