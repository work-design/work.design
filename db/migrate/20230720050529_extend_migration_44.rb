class ExtendMigration44 < ActiveRecord::Migration[7.0]

  def change
    add_column :wechat_corps, :enabled, :boolean

    add_belongs_to :profiled_profiles, :maintain
    add_belongs_to :profiled_profiles, :client
    rename_column :profiled_profiles, :corp_id, :corpid
  end

end
