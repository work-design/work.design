class RailsComMigration27 < ActiveRecord::Migration[6.1]

  def change







































    remove_column :wechat_news_reply_items, :pic_url, :string










































































    create_table :ship_locations do |t|
      t.references :area
      t.references :line
      t.string :poiname
      t.string :poiaddress
      t.string :cityname
      t.decimal :lat, precision: 10, scale: 8
      t.decimal :lng, precision: 11, scale: 8
      t.timestamps
    end

    create_table :ship_lines do |t|
      t.references :start_location
      t.references :finish_location
      t.string :start_name
      t.string :finish_name
      t.timestamps
    end








































  end

end
