class ExtendMigration55 < ActiveRecord::Migration[7.0]

  def change

    remove_column :wechat_auths, :ticket, :string

    add_column :wechat_agencies, :ticket, :string

  end

end
