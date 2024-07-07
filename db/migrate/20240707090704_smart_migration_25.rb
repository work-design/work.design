class SmartMigration25 < ActiveRecord::Migration[7.2]

  def change

    add_column :org_organs, :theme_settings, :jsonb, default: {}
  end

end
