class RenameTableAuthUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :auth_users, :users
  end
end
