class AddEnvVersionToWechatScenes < ActiveRecord::Migration[7.1]
  def change
    add_column :wechat_scenes, :env_version, :string
  end
end
