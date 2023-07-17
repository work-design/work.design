class ExtendMigration42 < ActiveRecord::Migration[7.0]

  def change
    add_column :profiled_profiles, :corp_id, :string
    add_column :profiled_profiles, :external_userid, :string
    add_column :profiled_profiles, :position, :string
    add_column :profiled_profiles, :avatar_url, :string
    add_column :profiled_profiles, :corp_name, :string
    add_column :profiled_profiles, :corp_full_name, :string
    add_column :profiled_profiles, :external_type, :string
    add_column :profiled_profiles, :unionid, :string, index: true

    add_column :org_members, :maintains_count, :integer
  end

end
