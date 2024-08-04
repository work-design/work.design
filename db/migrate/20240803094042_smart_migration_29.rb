class SmartMigration29 < ActiveRecord::Migration[7.2]

  def change

    add_column :org_organs, :invite_token, :string
  end

end
