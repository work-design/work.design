class AddMissingColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :wechat_agencies, :wechat_platform_id, :platform_id
    rename_column :wechat_auths, :wechat_platform_id, :platform_id
    rename_column :wechat_receives, :wechat_platform_id, :platform_id
    rename_column :wechat_extractions, :wechat_extractor_id, :extractor_id
    rename_column :wechat_scenes, :wechat_response_id, :response_id
    rename_column :wechat_services, :wechat_request_id, :request_id
  end
end
