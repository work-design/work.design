class ExtendMigration63 < ActiveRecord::Migration[7.0]

  def change
    add_column :org_organs, :production_enabled, :boolean
  end

end
