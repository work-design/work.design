class RenameCorpCorpIdToCorpid < ActiveRecord::Migration[7.0]
  def change
    rename_column :wechat_corps, :corp_id, :corpid
    rename_column :wechat_corp_users, :corp_id, :corpid
    rename_column :wechat_contacts, :corp_id, :corpid
    rename_column :wechat_qy_medias, :corp_id, :corpid
  end
end
