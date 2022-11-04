class ExtendMigration29 < ActiveRecord::Migration[7.0]

  def change

    add_belongs_to :ship_cars, :user

    add_column :ship_box_hosts, :rent_unit, :string

    remove_column :markdown_posts, :home, :boolean, comment: "是否首页，默认为 README.md"

    add_belongs_to :wechat_scenes, :handle, polymorphic: true

    add_column :trade_wallet_templates, :appid, :string, comment: "推广微信公众号"

    create_table :trade_wallet_goods do |t|
      t.belongs_to :wallet_template
      t.belongs_to :good, polymorphic: true
      t.string :wallet_code
      t.timestamps
    end

    add_belongs_to :trade_wallet_advances, :wallet_prepayment
    remove_column :trade_wallet_advances, :card_prepayment_id, :integer, scale: 8

    create_table :trade_rent_charges do |t|
      t.belongs_to :rentable, polymorphic: true
      t.integer :min
      t.integer :max
      t.integer :filter_min
      t.integer :filter_max
      t.boolean :contain_min
      t.boolean :contain_max
      t.decimal :parameter
      t.jsonb :wallet_price
      t.decimal :base_price
      t.jsonb :wallet_base_price
      t.jsonb :extra
      t.timestamps
    end

    add_column :trade_rents, :rent_start_at, :datetime
    add_column :trade_rents, :rent_finish_at, :datetime
    add_column :trade_rents, :rent_present_finish_at, :datetime
    add_column :trade_rents, :wallet_amount, :jsonb
    add_column :trade_rents, :rent_estimate_finish_at, :datetime
    add_column :trade_rents, :estimate_amount, :decimal
    add_column :trade_rents, :estimate_wallet_amount, :jsonb
    remove_column :trade_rents, :duration, :integer, scale: 4, default: "0"
    remove_column :trade_rents, :start_at, :datetime, precision: 6
    remove_column :trade_rents, :finish_at, :datetime, precision: 6
    remove_column :trade_rents, :estimate_finish_at, :datetime, precision: 6

    create_table :trade_addition_charges do |t|
      t.belongs_to :addition
      t.decimal :min
      t.decimal :max
      t.decimal :filter_min
      t.decimal :filter_max
      t.boolean :contain_min
      t.boolean :contain_max
      t.decimal :parameter
      t.jsonb :wallet_price
      t.decimal :base_price
      t.jsonb :wallet_base_price
      t.jsonb :extra
      t.timestamps
    end

    create_table :trade_additions do |t|
      t.belongs_to :organ
      t.belongs_to :deal, polymorphic: true
      t.string :name
      t.string :short_name
      t.string :code
      t.string :unit_code
      t.string :description
      t.string :metering
      t.boolean :editable, comment: "是否可更改价格"
      t.boolean :verified
      t.jsonb :extra
      t.timestamps
    end

    add_column :trade_promote_charges, :wallet_price, :jsonb
    add_column :trade_promote_charges, :wallet_base_price, :jsonb
    add_column :trade_promote_charges, :extra, :jsonb

    add_column :trade_items, :wallet_amount, :jsonb
    add_column :trade_items, :estimate_wallet_amount, :jsonb
    remove_column :trade_items, :duration, :integer, scale: 4, default: "0", comment: "占用时长"
    remove_column :trade_items, :estimate_metering, :jsonb
  end

end
