class CreateWechatHookds < ActiveRecord::Migration[6.1]
  def change
    create_table :wechat_hooks do |t|
      t.references :response
      t.references :hooked, polymorphic: true
      t.timestamps
    end
  end
end
