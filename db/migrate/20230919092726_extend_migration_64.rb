class ExtendMigration64 < ActiveRecord::Migration[7.1]

  def change

    add_column :com_states, :auth_token, :string

    add_belongs_to :wechat_supporters, :corp
    add_column :wechat_supporters, :corpid, :string
    remove_column :wechat_supporters, :agent_id, :integer, scale: 8

    add_column :wechat_scenes, :tag_name, :string


    add_column :wechat_corps, :inviting, :boolean, comment: "可邀请加入"
    add_column :wechat_corps, :user_name, :string
    add_column :wechat_corps, :domain, :string
    add_column :wechat_corps, :url_link, :string
    add_column :wechat_corps, :confirm_name, :string
    add_column :wechat_corps, :confirm_content, :string
    add_column :wechat_corps, :type, :string
    add_column :wechat_corps, :agentid, :string
    add_column :wechat_corps, :secret, :string
    remove_column :wechat_corps, :enabled, :boolean

    create_table :factory_stock_logs do |t|
      t.belongs_to :production
      t.belongs_to :source, polymorphic: true
      t.string :title
      t.string :tag_str
      t.decimal :amount
      t.timestamps
    end

    create_table :factory_production_provides do |t|
      t.belongs_to :organ
      t.belongs_to :provider
      t.belongs_to :product
      t.belongs_to :production
      t.belongs_to :upstream_product
      t.belongs_to :upstream_production
      t.timestamps
    end

    add_column :factory_productions, :stock, :decimal
    add_column :factory_productions, :last_stock_log, :jsonb
    remove_column :factory_productions, :provider_id, :integer, scale: 8
    remove_column :factory_productions, :upstream_id, :integer, scale: 8
    remove_column :factory_productions, :type, :string

    remove_column :factory_products, :type, :string
    remove_column :factory_products, :upstream_id, :integer, scale: 8

    add_column :trade_items, :purchase_id, :integer

  end

end
