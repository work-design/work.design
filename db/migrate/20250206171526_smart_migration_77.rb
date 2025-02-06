class SmartMigration77 < ActiveRecord::Migration[8.0]

  def change

    add_belongs_to :com_ssh_keys, :user
    add_column :com_ssh_keys, :domain, :string

  end

end
