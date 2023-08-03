class ExtendMigration51 < ActiveRecord::Migration[7.0]

  def change

    add_column :wechat_registers, :personal_wechat, :string
    add_column :wechat_registers, :organ_name, :string
    add_column :wechat_registers, :organ_code, :string

    add_belongs_to :wechat_agencies, :organ
    remove_column :wechat_agencies, :domain, :string
  end

end
