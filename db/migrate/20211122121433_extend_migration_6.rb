class ExtendMigration6 < ActiveRecord::Migration[7.0]

  def change

    add_column :users, :avatar_url, :string

    add_column :trade_trade_items, :produce_on, :date, comment: "对接生产管理"
    add_column :trade_trade_items, :expire_at, :datetime


    add_belongs_to :trade_cards, :cart
    remove_column :trade_cards, :user_id, :integer, scale: 8
    remove_column :trade_cards, :member_id, :integer, scale: 8

    add_belongs_to :trade_carts, :member_organ
    add_column :trade_carts, :auto, :boolean, default: false, comment: "自动下单"
    remove_column :trade_carts, :trade_items_count, :integer, scale: 4, default: "0"

    add_column :wechat_apps, :weapp_id, :string, comment: "关联的小程序"

    add_belongs_to :wechat_notices, :msg_request
    remove_column :wechat_notices, :subscribe_id, :integer, scale: 8

    remove_column :wechat_replies, :msg_type, :string, default: "news"

    add_column :wechat_requests, :sent_at, :datetime

    add_belongs_to :wechat_user_tags, :member_inviter

    add_column :wechat_receives, :msg_format, :string, default: "xml"

    add_belongs_to :factory_production_items, :production_plan
    remove_column :factory_production_items, :product_plan_id, :integer, scale: 8

    add_belongs_to :factory_product_taxons, :template
    add_belongs_to :factory_product_taxons, :scene

    create_table :factory_scenes do |t|
      t.belongs_to :organ
      t.string :title
      t.integer :book_start_days, default: 1
      t.time :book_start_at
      t.integer :book_finish_days, default: 0
      t.time :book_finish_at
      t.time :deliver_start_at
      t.time :deliver_finish_at
      t.boolean :specialty, default: false
      t.timestamps
    end

    add_belongs_to :factory_produce_plans, :scene
    add_column :factory_produce_plans, :produce_on, :date
    add_column :factory_produce_plans, :serial_number, :integer
    add_column :factory_produce_plans, :book_finish_at, :datetime
    add_column :factory_produce_plans, :book_start_at, :datetime
    remove_column :factory_produce_plans, :start_at, :datetime
    remove_column :factory_produce_plans, :finish_at, :datetime

    create_table :factory_production_plans do |t|
      t.belongs_to :production
      t.belongs_to :product
      t.belongs_to :scene
      t.datetime :start_at
      t.datetime :finish_at
      t.string :state
      t.integer :planned_count, default: 0
      t.integer :production_items_count, default: 0
      t.date :produce_on
      t.boolean :specialty, default: false, comment: "主推"
      t.timestamps
    end

    add_column :factory_produces, :name, :string
    add_column :factory_produces, :content, :string




    create_table :jia_bo_parameters do |t|
      t.belongs_to :template
      t.string :name, comment: "参数名称"
      t.string :code, comment: "参数 code"
      t.string :comment, comment: "评论"
      t.timestamps
    end

    create_table :jia_bo_templates do |t|
      t.belongs_to :app
      t.string :code, comment: "模板编号"
      t.string :type, comment: "模板类型"
      t.string :title, comment: "模板名称"
      t.timestamps
    end

    create_table :jia_bo_apps do |t|
      t.string :member_code
      t.string :api_key
      t.integer :devices_count, default: 0
      t.integer :templates_count, default: 0
      t.string :base_url, default: "https://api.poscom.cn/apisc"
      t.timestamps
    end

    create_table :jia_bo_devices do |t|
      t.belongs_to :app
      t.string :device_id
      t.string :dev_name
      t.string :grp_id
      t.timestamps
    end

  end

end
