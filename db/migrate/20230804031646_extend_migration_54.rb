class ExtendMigration54 < ActiveRecord::Migration[7.0]

  def change

    add_column :wechat_auths, :ticket, :string
  end

end
