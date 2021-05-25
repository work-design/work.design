class ChangeTemplateApidType < ActiveRecord::Migration[6.1]
  def change
    change_column :wechat_templates, :appid, :string
  end
end
