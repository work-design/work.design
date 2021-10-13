class ExtendMigration1 < ActiveRecord::Migration[7.0]

  def change

    remove_column :auth_accounts, :inviter_id, :integer, scale: 8

    remove_column :users, :inviter_id, :integer, scale: 8

    add_belongs_to :auth_oauth_users, :user_inviter
    add_belongs_to :auth_oauth_users, :member_inviter
    add_column :auth_oauth_users, :remark, :string
    remove_column :auth_oauth_users, :account_id, :integer, scale: 8
    remove_column :auth_oauth_users, :request_id, :integer, scale: 8

    add_column :auth_authorized_tokens, :uid, :string

    create_table :profiled_address_organs do |t|
      t.belongs_to :organ
      t.belongs_to :address
      t.string :kind
      t.boolean :default, default: false
      t.timestamps
    end

    add_belongs_to :trade_trade_items, :member

    add_column :trade_card_templates, :text_color, :string

    add_column :trade_carts, :current, :boolean, default: false

    add_column :org_members, :inviter, :boolean, default: false
    remove_column :org_members, :user_id, :integer, scale: 8

    add_column :wechat_template_configs, :appid, :string

    add_column :wechat_apps, :inviting, :boolean, default: false, comment: "可邀请加入"
    add_column :wechat_apps, :domain, :string
    add_column :wechat_apps, :url_link, :string

    remove_column :wechat_menus, :menu_type, :string

    add_column :wechat_replies, :msg_type, :string, default: "news"

    add_column :markdown_posts, :catalog_path, :string, default: ""
    add_column :markdown_posts, :ppt, :boolean, default: false

    create_table :markdown_catalogs do |t|
      t.string :name
      t.string :path
      t.string :parent_path
      t.timestamps
    end

    add_column :factory_products, :productions_count, :integer, default: 0
    remove_column :factory_products, :type, :string
    remove_column :factory_products, :price, :decimal, limit: 2, precision: 10
    remove_column :factory_products, :profit_price, :decimal, limit: 2, precision: 10
    remove_column :factory_products, :reference_price, :decimal, limit: 2, precision: 10
    remove_column :factory_products, :cost_price, :decimal, limit: 2, precision: 10

    remove_column :email_smtps, :name, :string

    
    remove_column :roled_role_rules, :rule_id, :integer, scale: 8

    add_column :com_acme_orders, :expire_at, :datetime, comment: "过期时间"

    add_column :com_acme_identifiers, :status, :string

    remove_column :com_blob_defaults, :private, :boolean, comment: "是否私有"

  end

end
