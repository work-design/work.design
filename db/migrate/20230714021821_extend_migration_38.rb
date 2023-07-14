class ExtendMigration38 < ActiveRecord::Migration[7.0]

  def change
    create_table :com_err_summaries do |t|
      t.string :controller_name
      t.string :action_name
      t.string :exception_object
      t.integer :errs_count
      t.timestamps
    end

    add_column :factory_productions, :presell, :boolean

    add_column :markdown_gits, :base_name, :string

    rename_column :wechat_contacts, :user_id, :userid

    add_belongs_to :wechat_requests, :scene_organ
  end

end
