class SmartMigration3 < ActiveRecord::Migration[7.1]

  def change

    add_column :auth_authorized_tokens, :mock_member, :boolean
  end

end
