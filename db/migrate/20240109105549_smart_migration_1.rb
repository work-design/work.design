class SmartMigration1 < ActiveRecord::Migration[7.1]

  def change

    add_column :com_meta_models, :business_identifier, :string, null: false

    create_table :com_filter_columns do |t|
      t.belongs_to :filter
      t.string :column
      t.string :value
      t.timestamps
    end

    create_table :com_filters do |t|
      t.belongs_to :organ
      t.string :controller_path, null: false
      t.string :action_name
      t.string :name
      t.timestamps
      t.index [:controller_path, :action_name]
    end

    create_table :com_err_bots do |t|
      t.string :type
      t.string :hook_url
      t.timestamps
    end

    create_table :cms_tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :cms_covers do |t|
      t.belongs_to :organ
      t.string :title
      t.timestamps
    end

    create_table :cms_audio_tags do |t|
      t.belongs_to :audio
      t.belongs_to :tag
      t.timestamps
    end

    add_column :auditor_audits, :type, :string


    rename_column :wechat_corp_external_users, :corp_id, :corpid

    add_column :wechat_notices, :result, :jsonb

    add_column :factory_stock_logs, :stock, :decimal

    add_column :factory_production_items, :amount, :decimal

    remove_column :factory_product_taxons, :partial, :boolean, default: "false"

    add_belongs_to :trade_carts, :contact
    add_belongs_to :trade_carts, :agent
    add_column :trade_carts, :purchasable, :boolean
    remove_column :trade_carts, :maintain_id, :integer, scale: 8

    add_belongs_to :profiled_addresses, :contact
    add_belongs_to :profiled_addresses, :agent
    rename_column :profiled_addresses, :contact, :contact_person
    remove_column :profiled_addresses, :maintain_id, :integer, scale: 8

    add_belongs_to :trade_deliveries, :contact
    add_belongs_to :trade_deliveries, :agent
    remove_column :trade_deliveries, :maintain_id, :integer, scale: 8

    add_belongs_to :trade_cards, :contact
    add_belongs_to :trade_cards, :agent
    remove_column :trade_cards, :maintain_id, :integer, scale: 8

    add_belongs_to :trade_wallets, :contact
    add_belongs_to :trade_wallets, :agent
    remove_column :trade_wallets, :maintain_id, :integer, scale: 8

    add_belongs_to :trade_promote_goods, :contact
    add_belongs_to :trade_promote_goods, :agent
    remove_column :trade_promote_goods, :maintain_id, :integer, scale: 8

    add_belongs_to :trade_orders, :contact
    add_belongs_to :trade_orders, :agent
    add_column :trade_orders, :payment_orders_count, :integer
    add_column :trade_orders, :refunded_amount, :decimal
    remove_column :trade_orders, :maintain_id, :integer, scale: 8

    add_belongs_to :trade_items, :contact
    add_belongs_to :trade_items, :agent
    remove_column :trade_items, :maintain_id, :integer, scale: 8

    create_table :notice_announcement_user_tags do |t|
      t.belongs_to :announcement
      t.belongs_to :user_tag
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcement_organs do |t|
      t.belongs_to :announcement
      t.belongs_to :organ
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcement_job_titles do |t|
      t.belongs_to :announcement
      t.belongs_to :job_title
      t.belongs_to :department
      t.belongs_to :organ
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcement_departments do |t|
      t.belongs_to :announcement
      t.belongs_to :department
      t.belongs_to :organ
      t.integer :notifications_count
      t.string :state
      t.datetime :announce_at
      t.timestamps
    end

    create_table :notice_announcements do |t|
      t.belongs_to :organ
      t.belongs_to :publisher, polymorphic: true
      t.string :type
      t.string :title
      t.string :body
      t.string :link
      t.integer :notifications_count
      t.integer :readed_count
      t.timestamps
    end

    add_column :notice_notifications, :type, :string
    remove_column :notice_notifications, :user_id, :integer, scale: 8
    remove_column :notice_notifications, :member_id, :integer, scale: 8

    remove_column :eventual_plan_items, :plan_id, :integer, scale: 4

    add_belongs_to :eventual_events, :time_list
    add_belongs_to :eventual_events, :place
    add_column :eventual_events, :begin_on, :date
    add_column :eventual_events, :end_on, :date
    add_column :eventual_events, :produced_begin_on, :date
    add_column :eventual_events, :produced_end_on, :date
    add_column :eventual_events, :produce_done, :boolean
    add_column :eventual_events, :repeat_type, :string
    add_column :eventual_events, :repeat_count, :integer, comment: "每几周/天"
    add_column :eventual_events, :repeat_days, :string, array: true

    add_column :org_organ_domains, :redirect_controller, :string
    add_column :org_organ_domains, :redirect_action, :string, comment: "默认跳转"
    remove_column :org_organ_domains, :port, :string, default: "3000"
    remove_column :org_organ_domains, :identifier, :string

    remove_column :org_organs, :redirect_controller, :string
    remove_column :org_organs, :redirect_action, :string, comment: "默认跳转"

    remove_column :org_members, :owned, :boolean
    remove_column :org_members, :user_id, :integer, scale: 8

    create_table :crm_notes do |t|
      t.belongs_to :member
      t.belongs_to :client
      t.belongs_to :contact
      t.belongs_to :logged, polymorphic: true
      t.belongs_to :maintain_tag
      t.string :content
      t.string :tag_str
      t.integer :tag_sequence
      t.jsonb :extra
      t.timestamps
    end

    add_column :crm_maintain_tags, :notes_count, :integer
    remove_column :crm_maintain_tags, :maintain_logs_count, :integer, scale: 4, default: "0"

    create_table :crm_client_hierarchies do |t|
      t.belongs_to :ancestor
      t.belongs_to :descendant
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "crm/client_anc_desc_idx"
    end

    create_table :crm_clients do |t|
      t.belongs_to :parent
      t.belongs_to :organ
      t.belongs_to :client_organ
      t.jsonb :parent_ancestors
      t.string :name
      t.jsonb :settings
      t.boolean :vendor
      t.integer :wallets_count
      t.integer :cards_count
      t.integer :orders_count
      t.integer :addresses_count
      t.integer :items_count
      t.integer :carts_count
      t.timestamps
    end

    create_table :crm_contacts do |t|
      t.belongs_to :organ
      t.belongs_to :client_member
      t.belongs_to :client_user
      t.belongs_to :client
      t.string :name
      t.string :identity
      t.jsonb :extra
      t.boolean :default
      t.integer :wallets_count
      t.integer :cards_count
      t.integer :orders_count
      t.integer :addresses_count
      t.integer :items_count
      t.integer :carts_count
      t.string :corpid
      t.string :external_userid
      t.string :position
      t.string :avatar_url
      t.string :corp_name
      t.string :corp_full_name
      t.string :external_type
      t.string :unionid, index: true
      t.timestamps
    end

    add_belongs_to :crm_maintains, :contact
    remove_column :crm_maintains, :payment_strategy_id, :integer, scale: 8
    remove_column :crm_maintains, :deposit_ratio, :integer, scale: 4, default: "100", comment: "最小预付比例"
    remove_column :crm_maintains, :client_user_id, :integer, scale: 8
    remove_column :crm_maintains, :client_member_id, :integer, scale: 8
    remove_column :crm_maintains, :wallets_count, :integer, scale: 4, default: "0"
    remove_column :crm_maintains, :cards_count, :integer, scale: 4, default: "0"
    remove_column :crm_maintains, :orders_count, :integer, scale: 4, default: "0"
    remove_column :crm_maintains, :addresses_count, :integer, scale: 4, default: "0"
    remove_column :crm_maintains, :items_count, :integer, scale: 4
    remove_column :crm_maintains, :carts_count, :integer, scale: 4

    add_column :auth_authorized_tokens, :online, :boolean
  end

end
