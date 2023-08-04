class ExtendMigration58 < ActiveRecord::Migration[7.0]

  def change
    add_column :wechat_agencies, :logo_media_id, :string
  end

end
