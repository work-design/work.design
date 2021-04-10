class RemoveUserFromAuthorizedToken < ActiveRecord::Migration[6.1]
  def change
    remove_columns :authorized_tokens, :user_id, :oauth_user_id
  end
end
