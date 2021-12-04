class ExtendMigration1 < ActiveRecord::Migration[7.0]

  def change


    add_column :roled_roles, :type, :string
    remove_column :roled_roles, :who_types, :string

    add_column :roled_who_roles, :type, :string
    remove_column :roled_who_roles, :who_type, :string

  end

end
