class ChangeRequetEncryptType < ActiveRecord::Migration[6.1]
  def change
    remove_columns :wechat_requests, :reply_body, :reply_encrypt
    add_column :wechat_requests, :reply_body, :jsonb
    add_column :wechat_requests, :reply_encrypt, :jsonb
  end
end
