class ExtendMigration9 < ActiveRecord::Migration[7.0]

  def change

    add_column :users, :promote_goods_count, :integer, default: 0



    add_column :bench_tasks, :deadline_on, :date

    add_belongs_to :bench_facilitate_taxons, :taxon
    remove_column :bench_facilitate_taxons, :organ_id, :integer, scale: 8
    remove_column :bench_facilitate_taxons, :project_taxon_id, :integer, scale: 8

    remove_column :bench_indicators, :organ_id, :integer, scale: 8
    remove_column :bench_indicators, :project_taxon_id, :integer, scale: 8

    remove_column :project_taxons, :organ_id, :integer, scale: 8

    remove_column :bench_facilitates, :organ_id, :integer, scale: 8

    remove_column :bench_task_templates, :project_taxon_id, :integer, scale: 8

    add_column :wechat_corp_users, :suite_id, :string
    remove_column :wechat_corp_users, :provider_id, :integer, scale: 8

    create_table :wechat_suite_tickets do |t|
      t.string :suite_id
      t.string :ticket_data
      t.string :agent_id
      t.jsonb :message_hash
      t.string :info_type
      t.string :auth_corp_id
      t.string :user_id
      t.timestamps
    end

    create_table :wechat_follows do |t|
      t.string :userid
      t.string :remark
      t.string :description
      t.string :state
      t.string :oper_userid
      t.string :add_way
      t.string :corp_id
      t.string :external_userid
      t.timestamps
    end

    remove_column :wechat_providers, :suite_id, :string
    remove_column :wechat_providers, :secret, :string
    remove_column :wechat_providers, :suite_ticket, :string
    remove_column :wechat_providers, :suite_ticket_pre, :string
    remove_column :wechat_providers, :pre_auth_code, :string
    remove_column :wechat_providers, :pre_auth_code_expires_at, :datetime, precision: 6
    remove_column :wechat_providers, :provider_access_token, :string
    remove_column :wechat_providers, :provider_access_token_expires_at, :datetime, precision: 6

    create_table :wechat_suites do |t|
      t.string :name
      t.string :corp_id
      t.string :suite_id
      t.string :secret
      t.string :token
      t.string :encoding_aes_key
      t.string :suite_ticket
      t.string :suite_ticket_pre
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :pre_auth_code
      t.datetime :pre_auth_code_expires_at
      t.string :redirect_controller
      t.string :redirect_action, default: "index", comment: "默认跳转"
      t.timestamps
    end

    add_column :wechat_user_tags, :synced, :boolean, default: false

    create_table :wechat_suite_receives do |t|
      t.belongs_to :provider
      t.string :corp_id, index: true
      t.string :user_id, index: true
      t.string :suite_id
      t.string :agent_id
      t.string :msg_id
      t.string :msg_type
      t.string :event
      t.string :event_key
      t.string :content
      t.string :encrypt_data
      t.jsonb :message_hash
      t.string :msg_format, default: "xml"
      t.timestamps
    end

    create_table :wechat_qy_medias do |t|
      t.belongs_to :medium, polymorphic: true
      t.string :corp_id, index: true
      t.string :suite_id, index: true
      t.string :media_id
      t.string :url
      t.string :medium_attach
      t.timestamps
    end

    add_column :wechat_corps, :suite_id, :string
    remove_column :wechat_corps, :organ_id, :integer, scale: 8

    create_table :wechat_externals do |t|
      t.string :corp_id
      t.string :external_userid
      t.string :name
      t.string :position
      t.string :avatar
      t.string :corp_name
      t.string :corp_full_name
      t.string :external_type
      t.string :gender
      t.string :unionid
      t.timestamps
    end

    create_table :wechat_app_menus do |t|
      t.belongs_to :scene
      t.belongs_to :tag
      t.belongs_to :menu
      t.string :appid
      t.timestamps
    end

    create_table :wechat_contacts do |t|
      t.string :corp_id
      t.string :user_id
      t.string :part_id
      t.string :config_id
      t.string :qr_code
      t.string :remark
      t.string :state
      t.boolean :skip_verify, default: true
      t.string :suite_id
      t.timestamps
    end

    add_belongs_to :wechat_menus, :organ

    add_column :org_members, :promote_goods_count, :integer, default: 0

    add_belongs_to :org_organs, :corp_user
    add_column :org_organs, :corp_id, :string

    add_column :trade_carts, :extra, :jsonb, default: {}

    add_column :factory_product_part_taxons, :product_parts_count, :integer, default: 0
    remove_column :factory_product_part_taxons, :part_taxon_ancestors, :json

    remove_column :factory_part_taxons, :parent_id, :integer, scale: 8
    remove_column :factory_part_taxons, :parent_ancestors, :jsonb

    add_column :factory_products, :product_parts_count, :integer, default: 0
    remove_column :factory_products, :product_taxon_ancestors, :json
    remove_column :factory_products, :str_part_ids, :string

    remove_column :factory_parts, :part_taxon_ancestors, :jsonb

    remove_column :factory_production_parts, :price, :decimal, default: "0.0"

    add_column :factory_productions, :base_price, :decimal, default: 0

    add_belongs_to :factory_production_plans, :organ

    create_table :trade_item_promotes do |t|
      t.belongs_to :organ
      t.belongs_to :cart_promote
      t.belongs_to :trade_item
      t.belongs_to :promote_good
      t.belongs_to :promote
      t.integer :sequence
      t.decimal :amount, default: 0, comment: ""
      t.string :promote_name
      t.string :status, default: "init"
      t.timestamps
    end

    remove_column :trade_promotes, :scope, :string

    remove_column :trade_cards, :cart_id, :integer, scale: 8

    remove_column :trade_payment_references, :cart_id, :integer, scale: 8

    create_table :trade_cart_promotes do |t|
      t.belongs_to :cart
      t.belongs_to :organ
      t.belongs_to :order
      t.belongs_to :promote
      t.belongs_to :promote_charge
      t.belongs_to :promote_good
      t.integer :sequence
      t.decimal :original_amount, comment: "初始价格"
      t.decimal :based_amount, default: 0, comment: "基于此价格计算，默认为 trade_item 的 amount，与sequence有关"
      t.decimal :computed_amount, default: 0, comment: "计算出的价格"
      t.decimal :amount, default: 0, comment: "默认等于 computed_amount，如果客服人员修改过价格后，则 amount 会发生变化"
      t.string :note, comment: "备注"
      t.boolean :edited, default: false, comment: "是否被客服改过价"
      t.string :promote_name
      t.string :status, default: "init"
      t.timestamps
    end

    remove_column :trade_wallets, :cart_id, :integer, scale: 8

    remove_column :trade_orders, :cart_id, :integer, scale: 8

    add_column :trade_promote_goods, :type, :string
    add_column :trade_promote_goods, :item_promotes_count, :integer, default: 0
    add_column :trade_promote_goods, :cart_promotes_count, :integer, default: 0
    add_column :trade_promote_goods, :identity, :string
    add_column :trade_promote_goods, :blacklists_count, :integer, default: 0
    remove_column :trade_promote_goods, :trade_promotes_count, :integer, scale: 4, default: "0"

    add_column :trade_trade_items, :vip_code, :string
    remove_column :trade_trade_items, :cart_id, :integer, scale: 8

    add_column :auth_oauth_users, :unsubscribe_at, :datetime

  end

end
