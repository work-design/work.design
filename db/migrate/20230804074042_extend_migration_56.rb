class ExtendMigration56 < ActiveRecord::Migration[7.0]

  def change
    add_column :org_organs, :license, :string
  end

end
