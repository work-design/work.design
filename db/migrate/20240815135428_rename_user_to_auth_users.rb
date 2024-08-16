class RenameUserToAuthUsers < ActiveRecord::Migration[7.2]
  def change
    rename_table :users, :auth_users
  end
end
