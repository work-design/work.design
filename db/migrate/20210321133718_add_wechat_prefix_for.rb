class AddWechatPrefixFor < ActiveRecord::Migration[6.1]
  def change
    rename_table :scenes, :wechat_scenes
    rename_table :scene_menus, :wechat_scene_menus
    rename_table :news_reply_items, :wechat_news_reply_items
    rename_table :template_configs, :wechat_template_configs
    rename_table :template_key_words, :wechat_template_key_words

    rename_column :wechat_templates, :wechat_app_id, :app_id
  end
end
