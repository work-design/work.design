class RemoveUserIdFromOauthUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :oauth_users, :request
    remove_columns :oauth_users, :user_id
  end
end
