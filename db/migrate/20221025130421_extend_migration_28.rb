class ExtendMigration28 < ActiveRecord::Migration[7.0]

  def change

    create_table :wechat_app_configs do |t|
      t.string :appid, index: true
      t.string :value
      t.string :key
      t.timestamps
    end

    add_belongs_to :trade_payments, :payee
    add_column :trade_payments, :extra_params, :jsonb
    remove_column :trade_payments, :appid, :string
  end

end
