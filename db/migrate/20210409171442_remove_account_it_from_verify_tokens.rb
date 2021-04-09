class RemoveAccountItFromVerifyTokens < ActiveRecord::Migration[6.1]
  def change
    remove_columns :verify_tokens, :user_id, :account_id
  end
end
