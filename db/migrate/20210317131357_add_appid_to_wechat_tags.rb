class AddAppidToWechatTags < ActiveRecord::Migration[6.1]
  def change
    add_column :wechat_tags, :appid, :string, index: true
    Wechat::Tag.find_each do |i|
      i.appid = Wechat::App.find_by(id: i.wechat_app_id)&.appid
      i.save
    end
    remove_column :wechat_tags, :wechat_app_id
  end
end
