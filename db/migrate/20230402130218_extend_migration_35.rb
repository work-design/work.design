class ExtendMigration35 < ActiveRecord::Migration[7.0]

  def change

    add_column :org_members, :corp_userid, :string
    add_column :org_members, :wechat_openid, :string
  end

end
