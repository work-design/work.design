class SmartMigration6 < ActiveRecord::Migration[7.2]

  def change
    create_table :douyin_shops do |t|
      t.belongs_to :organ
      t.string :name
      t.string :appid, index: true
      t.string :poi_id
      t.timestamps
    end

    create_table :douyin_orders do |t|
      t.string :poi_id
      t.string :appid
      t.string :code
      t.string :verify_id
      t.string :certificate_id
      t.string :origin_code
      t.string :account_id
      t.string :uuid
      t.string :verify_token
      t.jsonb :extra
      t.jsonb :verify_results
      t.timestamps
    end

    create_table :douyin_apps do |t|
      t.belongs_to :organ
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.string :open_id
      t.timestamps
    end
  end

end
