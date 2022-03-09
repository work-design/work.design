class ExtendMigration8 < ActiveRecord::Migration[7.0]

  def change

    add_column :com_blob_defaults, :macro, :string

    remove_column :com_acme_identifiers, :dns_valid, :boolean
    remove_column :com_acme_identifiers, :file_valid, :boolean

    add_column :com_debugs, :state, :string, default: "init"

    add_column :bench_facilitates, :good_type, :string
    add_column :finance_funds, :good_type, :string

    add_column :wechat_apps, :global, :boolean, default: false

    create_table :factory_scene_automatics do |t|
      t.belongs_to :organ
      t.belongs_to :scene
      t.integer :advance_days, default: 1
      t.timestamps
    end

    add_column :factory_produce_plans, :production_plans_count, :integer, default: 0

    remove_column :factory_scenes, :organ_id, :integer, scale: 8
    remove_column :factory_scenes, :automatic, :boolean, default: "false"

    add_column :factory_productions, :good_type, :string

    add_column :trade_purchases, :good_type, :string

    add_column :trade_advances, :good_type, :string



    add_belongs_to :trade_wallets, :organ
    add_belongs_to :trade_wallets, :user
    add_belongs_to :trade_wallets, :member
    add_belongs_to :trade_wallets, :member_organ

    add_belongs_to :trade_refunds, :wallet

    add_belongs_to :trade_payments, :wallet

    add_belongs_to :trade_promote_goods, :organ
    add_belongs_to :trade_promote_goods, :user
    add_belongs_to :trade_promote_goods, :member
    add_belongs_to :trade_promote_goods, :member_organ
    add_column :trade_promote_goods, :state, :string, default: "unused"
    add_column :trade_promote_goods, :trade_promotes_count, :integer, default: 0

    remove_column :trade_trade_items, :produce_plan_id, :integer, scale: 8

    create_table :auth_disposable_tokens do |t|
      t.string :token, index: {:unique=>true}
      t.string :identity, index: true
      t.datetime :used_at
      t.timestamps
    end
  end

end
