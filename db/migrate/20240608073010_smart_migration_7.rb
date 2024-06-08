class SmartMigration7 < ActiveRecord::Migration[7.2]

  def change

    create_table :qingflow_apps do |t|
      t.belongs_to :organ
      t.string :name
      t.string :appid, index: true
      t.string :secret
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.datetime :refresh_token_expires_at
      t.timestamps
    end

  end

end
