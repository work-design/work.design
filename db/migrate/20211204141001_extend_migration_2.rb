class ExtendMigration2 < ActiveRecord::Migration[7.0]

  def change

    remove_column :users, :cached_role_ids, :integer, scale: 4


    remove_column :org_organs, :cached_role_ids, :integer, scale: 4

    remove_column :org_members, :cached_role_ids, :integer, scale: 4

    remove_column :org_job_titles, :cached_role_ids, :integer, scale: 4

    remove_column :org_super_job_titles, :cached_role_ids, :integer, scale: 4

    add_column :markdown_catalogs, :nav, :boolean, default: false, comment: "是否导航菜单"


  end

end
