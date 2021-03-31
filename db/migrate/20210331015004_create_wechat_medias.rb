class CreateWechatMedias < ActiveRecord::Migration[6.1]
  def change
    create_table :wechat_medias do |t|
      t.references :user
      t.references :source, polymorphic: true
      t.string :attachment_name
      t.string :media_id
      t.string :appid
      t.timestamps
    end

    remove_column :ship_drivers, :media_id
    remove_column :ship_cars, :media_id
  end
end
