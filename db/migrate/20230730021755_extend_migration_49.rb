class ExtendMigration49 < ActiveRecord::Migration[7.0]

  def change
    add_belongs_to :org_members, :member_inviter

    add_column :org_organ_domains, :kind, :string

    add_belongs_to :org_organs, :creator
    add_belongs_to :org_organs, :provider
    remove_column :org_organs, :domain, :string


    remove_column :auth_oauth_users, :member_inviter_id, :integer, scale: 8
  end

end
