class ExtendMigration36 < ActiveRecord::Migration[7.0]

  def change
    add_column :ship_box_hosts, :rent_charges_count, :integer

    add_column :factory_product_taxons, :nav, :boolean, comment: "单独分类"

    add_column :factory_products, :position, :integer

    add_column :trade_carts, :fresh, :boolean

    add_column :factory_productions, :position, :integer
    add_column :factory_productions, :rent_charges_count, :integer
    add_column :factory_productions, :rent_unit, :string
    remove_column :factory_productions, :base_price, :decimal, default: "0.0"

    remove_column :markdown_gits, :host, :string

    add_column :wechat_suite_receives, :suiteid, :string, index: true
    add_column :wechat_suite_receives, :corpid, :string, index: true
    add_column :wechat_suite_receives, :auth_corp_id, :string
    add_column :wechat_suite_receives, :info_type, :string
    remove_column :wechat_suite_receives, :corp_id, :string
    remove_column :wechat_suite_receives, :suite_id, :string
    remove_column :wechat_suite_receives, :content, :string

    add_column :wechat_receives, :info_type, :string

    add_column :wechat_platform_tickets, :message_hash, :jsonb
    add_column :wechat_platform_tickets, :info_type, :string

    create_table :wechat_platform_templates do |t|
      t.belongs_to :platform
      t.string :user_version
      t.string :user_desc
      t.integer :template_id
      t.integer :audit_status
      t.timestamps
    end

    add_belongs_to :wechat_platforms, :public_agency
    add_belongs_to :wechat_platforms, :program_agency

    create_table :wechat_payee_domains do |t|
      t.string :mch_id, index: true
      t.string :domain, index: true
      t.timestamps
    end

    create_table :wechat_payee_apps do |t|
      t.string :mch_id, index: true
      t.string :appid, index: true
      t.boolean :enabled
      t.timestamps
    end

    add_column :wechat_corp_users, :userid, :string, index: true
    remove_column :wechat_corp_users, :user_id, :string
    remove_column :wechat_corp_users, :mobile, :string

    create_table :wechat_corp_external_users do |t|
      t.string :uid, index: true
      t.string :unionid, index: true
      t.string :external_userid, index: true
      t.string :pending_id
      t.string :corp_id, index: true
      t.string :subject_type
      t.timestamps
    end

    create_table :wechat_agents do |t|
      t.belongs_to :organ
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :jsapi_ticket
      t.datetime :jsapi_ticket_expires_at
      t.string :name
      t.boolean :inviting, comment: "可邀请加入"
      t.string :corpid
      t.string :secret
      t.string :token
      t.string :agentid
      t.string :encoding_aes_key
      t.string :user_name
      t.string :domain
      t.string :url_link
      t.boolean :debug
      t.string :confirm_name
      t.string :confirm_content
      t.timestamps
    end

    add_column :wechat_apps, :confirm_name, :string
    add_column :wechat_apps, :confirm_content, :string
    remove_column :wechat_apps, :agentid, :string
    remove_column :wechat_apps, :oauth2_state, :string
    remove_column :wechat_apps, :app_payees_count, :integer, scale: 4

    add_belongs_to :wechat_agencies, :platform_template
    add_column :wechat_agencies, :type, :string
    add_column :wechat_agencies, :extra, :jsonb
    add_column :wechat_agencies, :domain, :string
    add_column :wechat_agencies, :auditid, :integer
    add_column :wechat_agencies, :version_info, :jsonb
    add_column :wechat_agencies, :audit_status, :integer
    add_column :wechat_agencies, :confirm_name, :string
    add_column :wechat_agencies, :confirm_content, :string
    remove_column :wechat_agencies, :default, :boolean

    create_table :trade_wallet_frozens do |t|
      t.belongs_to :operator
      t.belongs_to :wallet
      t.belongs_to :item
      t.decimal :amount
      t.string :note
      t.string :state
      t.timestamps
    end

    add_belongs_to :trade_payment_references, :organ
    add_belongs_to :trade_payment_references, :member_organ
    add_belongs_to :trade_payment_references, :client

    create_table :trade_holds do |t|
      t.belongs_to :user
      t.belongs_to :member
      t.belongs_to :member_organ
      t.belongs_to :item
      t.belongs_to :rentable, polymorphic: true
      t.decimal :amount
      t.datetime :rent_start_at
      t.datetime :rent_finish_at, comment: "实际结束时间"
      t.datetime :rent_present_finish_at, comment: "周期性计费时间"
      t.datetime :rent_estimate_finish_at, comment: "预估结束时间"
      t.integer :rent_duration
      t.integer :rent_estimate_duration
      t.jsonb :wallet_amount
      t.decimal :estimate_amount
      t.jsonb :estimate_wallet_amount
      t.decimal :invest_amount, comment: "投资分成"
      t.jsonb :extra
      t.string :job_id
      t.timestamps
    end

    add_column :trade_wallets, :frozen_amount, :decimal, comment: "支出：冻结金额"
    add_column :trade_wallets, :payout_amount, :decimal, comment: "支出：提现"
    add_column :trade_wallets, :payment_amount, :decimal, comment: "支出：钱包支付"

    add_belongs_to :trade_orders, :operator

    add_belongs_to :trade_items, :operator
    add_column :trade_items, :holds_count, :integer
    remove_column :trade_items, :rent_start_at, :datetime, precision: 6
    remove_column :trade_items, :rent_estimate_finish_at, :datetime, precision: 6
    remove_column :trade_items, :rent_finish_at, :datetime, precision: 6
    remove_column :trade_items, :rent_present_finish_at, :datetime, precision: 6
    remove_column :trade_items, :estimate_amount, :jsonb
    remove_column :trade_items, :estimate_wallet_amount, :jsonb

    add_belongs_to :profiled_profiles, :user

    add_column :org_organs, :appid, :string

    add_belongs_to :org_members, :user

    add_column :auth_authorized_tokens, :corp_userid, :string
    remove_column :auth_authorized_tokens, :session_key, :string, comment: "目前在小程序下用到"

    add_belongs_to :auth_oauth_users, :user
    add_column :auth_oauth_users, :scope, :string
    add_column :auth_oauth_users, :session_key, :string
  end

end
