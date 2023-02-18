class ExtendMigration32 < ActiveRecord::Migration[7.0]

  def change

    create_table :good_job_batches do |t|
      t.jsonb :serialized_properties
      t.timestamps
    end

    create_table :jia_bo_device_organs do |t|
      t.belongs_to :device
      t.belongs_to :organ
      t.boolean :default
      t.timestamps
    end

    remove_column :jia_bo_devices, :organ_id, :integer, scale: 8
    remove_column :jia_bo_devices, :default, :boolean, default: "false"

    add_column :jia_bo_apps, :name, :string
    remove_column :jia_bo_apps, :base_url, :string, default: "https://api.poscom.cn/apisc"

    remove_column :users, :avatar_url, :string

    add_column :space_stations, :poiname, :string
    add_column :space_stations, :poiaddress, :string
    add_column :space_stations, :cityname, :string
    add_column :space_stations, :lat, :decimal
    add_column :space_stations, :lng, :decimal
    add_column :space_stations, :coordinate, :point

    create_table :space_desks do |t|
      t.belongs_to :room
      t.string :name
      t.string :code
      t.integer :width
      t.integer :height
      t.integer :length
      t.timestamps
    end

    remove_column :wechat_responses, :request_types, :string

    add_column :wechat_platforms, :domain, :string

    create_table :wechat_menu_roots do |t|
      t.belongs_to :organ
      t.string :name
      t.integer :position
      t.string :appid
      t.timestamps
    end

    create_table :wechat_menu_apps do |t|
      t.belongs_to :menu
      t.belongs_to :scene
      t.belongs_to :tag
      t.string :appid, index: true
      t.timestamps
    end

    add_column :wechat_agencies, :default, :boolean

    add_column :wechat_menus, :root_position, :integer
    remove_column :wechat_menus, :parent_id, :integer, scale: 8

    create_table :trade_deliveries do |t|
      t.belongs_to :user
      t.belongs_to :member
      t.belongs_to :member_organ
      t.belongs_to :client
      t.belongs_to :organ
      t.belongs_to :scene
      t.belongs_to :order
      t.boolean :fetch_oneself, comment: "自取"
      t.datetime :fetch_start_at
      t.datetime :fetch_finish_at
      t.date :produce_on, comment: "对接生产管理"
      t.string :state
      t.timestamps
    end

    add_belongs_to :trade_card_templates, :parent
    add_column :trade_card_templates, :enabled, :boolean

    remove_column :trade_orders, :pay_later, :boolean, default: "false"

    add_column :trade_items, :delivery_status, :string
    remove_column :trade_items, :produce_on, :date, comment: "对接生产管理"
    remove_column :trade_items, :scene_id, :integer, scale: 8
    remove_column :trade_items, :fetch_oneself, :boolean, default: "false", comment: "自取"
    remove_column :trade_items, :fetch_start_at, :datetime, precision: 6
    remove_column :trade_items, :fetch_finish_at, :datetime, precision: 6
    remove_column :trade_items, :delivery, :string, default: "init"

    remove_column :trade_cards, :item_id, :integer, scale: 8

    add_column :org_organs, :redirect_controller, :string
    add_column :org_organs, :redirect_action, :string, comment: "默认跳转"

    drop_table :auth_authorized_tokens
  end

end
