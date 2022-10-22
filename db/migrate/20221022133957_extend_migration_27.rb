class ExtendMigration27 < ActiveRecord::Migration[7.0]

  def change

    add_column :markdown_posts, :slug, :string

    create_table :wechat_receivers do |t|
      t.belongs_to :payee
      t.string :account
      t.string :name
      t.string :custom_relation
      t.jsonb :res
      t.string :receiver_type
      t.string :relation_type
      t.timestamps
    end

    add_column :wechat_payees, :platform_effective_at, :datetime
    add_column :wechat_payees, :platform_expire_at, :datetime
    add_column :wechat_payees, :platform_serial_no, :string
    add_column :wechat_payees, :encrypt_certificate, :jsonb

    add_column :wechat_apps, :payees_count, :integer

    add_column :trade_payments, :appid, :string

    add_column :trade_items, :rent_present_finish_at, :datetime
    add_column :trade_items, :estimate_metering, :jsonb
    add_column :trade_items, :estimate_amount, :jsonb
  end

end
