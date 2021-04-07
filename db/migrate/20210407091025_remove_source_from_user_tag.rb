class RemoveSourceFromUserTag < ActiveRecord::Migration[6.1]
  def change
    add_column :wechat_user_tags, :appid, :string, index: true
    add_column :wechat_user_tags, :tag_name, :string, index: true
    add_column :wechat_user_tags, :open_id, :string, index: true

    Wechat::UserTag.find_each do |i|
      user =  Wechat::WechatUser.find_by(id: i.wechat_user_id)
      if user
        i.appid = user.app_id
        i.open_id = user.uid
      end
      _tag = Wechat::Tag.find_by(id: i.tag_id)
      if _tag
        i.tag_name = _tag.name
      end
      i.save
    end

    remove_columns :wechat_user_tags, :source_type, :source_id, :source_kind, :wechat_user_id, :tag_id

    add_column :wechat_requests, :init_wechat_user, :boolean
    add_column :wechat_requests, :init_user_tag, :boolean

    remove_column :wechat_requests, :user_tag_id
  end
end
