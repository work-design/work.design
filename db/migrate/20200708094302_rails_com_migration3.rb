class RailsComMigration3 < ActiveRecord::Migration[6.0]

  def change







    add_column :organs, :joinable, :boolean, comment: "是否可搜索并加入"







    add_column :profiles, :real_name, :string
    add_column :profiles, :nick_name, :string


    remove_column :agencies, :client_type, :string
    remove_column :agencies, :agent_type, :string













































    create_table :wechat_registers do |t|
      t.references :member
      t.string :id_name
      t.string :id_number
      t.timestamps
    end








































































































































    remove_column :maintains, :client_type, :string
    remove_column :maintains, :agent_type, :string



















  end

end
