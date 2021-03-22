class RenameWechatTagIdWechat < ActiveRecord::Migration[6.1]
  def change
    rename_column :wechat_user_tags, :wechat_tag_id, :tag_id
    rename_column :wechat_auths, :wechat_request_id, :request_id
    rename_column :wechat_extractions, :wechat_request_id, :request_id
    rename_column :wechat_request_replies, :wechat_request_id, :request_id
    rename_column :wechat_request_replies, :wechat_reply_id, :reply_id
    rename_column :wechat_requests, :wechat_reply_id, :reply_id
    rename_column :wechat_requests, :wechat_received_id, :received_id
    rename_column :wechat_scene_menus, :wechat_menu_id, :menu_id
    rename_column :wechat_extractors, :wechat_response_id, :response_id
    rename_column :wechat_response_requests, :wechat_response_id, :response_id
    rename_column :wechat_subscribeds, :wechat_template_id, :template_id
    rename_column :wechat_notices, :wechat_template_id, :template_id
    rename_column :wechat_notices, :wechat_subscribed_id, :subscribed_id
  end
end
